#################################
# Create Desktop Shortcut
#################################
function CreateDesktopShortcut( $TechnicalArea ){
	$DesktopPath = Join-Path ($env:HOMEDRIVE) ($env:HOMEPATH)
	$DesktopPath = Join-Path $DesktopPath "Desktop"

	$LinkFile = $TechnicalArea + ".lnk"
	$ShortcutPath = Join-Path $DesktopPath $LinkFile

	$BatFile = $TechnicalArea + ".bat"
    $BatFile = $BatFile.Replace( ' ', '_' )
	$TergetBatchPath = Join-Path $PSScriptRoot $BatFile

	$WsShell = New-Object -ComObject WScript.Shell
	$Shortcut = $WsShell.CreateShortcut($ShortcutPath)
	$Shortcut.TargetPath = $TergetBatchPath
	$Shortcut.Save()
}

#################################
# Main
#################################
$CsvPath = Join-Path $PSScriptRoot "CreatorID.csv"
if( -not (Test-Path $CsvPath)){
	Write-Output "[FAIL] $CsvPath not found."
	exit
}

$BasePs1 = Join-Path $PSScriptRoot "SetPrefix4URI.ps1"
if( -not (Test-Path $BasePs1)){
	Write-Output "[FAIL] $BasePs1 not found."
	exit
}

$BaseBat = Join-Path $PSScriptRoot "SetPrifix4URI.bat"
if( -not (Test-Path $BaseBat)){
	Write-Output "[FAIL] $BaseBat not found."
	exit
}


$CsvData = Import-Csv $CsvPath
foreach( $Recode in $CsvData ){
	$BasePs1Code = Get-Content $BasePs1 -Encoding utf8
	$NewPs1Code = $BasePs1Code.Replace( '##CreatorID##', $Recode.CreatorID )
	$OutPutFileName = $Recode.TechnicalArea + ".ps1"
    $OutPutFileName = $OutPutFileName.Replace( ' ', '_' )
	$OutputFilePath = Join-Path $PSScriptRoot $OutPutFileName
	$NewPs1Code | Set-Content -Path $OutputFilePath -Encoding utf8

	$BaseBatCode = Get-Content $BaseBat -Encoding oem
    $TechnicalArea = $Recode.TechnicalArea.Replace( ' ', '_' )
	$NewBatCode = $BaseBatCode.Replace( '##TechnicalArea##', $TechnicalArea )
	$OutPutFileName = $TechnicalArea + ".bat"
	$OutputFilePath = Join-Path $PSScriptRoot $OutPutFileName
	$NewBatCode | Set-Content -Path $OutputFilePath -Encoding oem

	CreateDesktopShortcut $Recode.TechnicalArea
}
