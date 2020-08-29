#################################
# Create Desktop Shortcut
#################################
$DesktopPath = Join-Path ($env:HOMEDRIVE) ($env:HOMEPATH)
$DesktopPath = Join-Path $DesktopPath "Desktop"

$ShortcutPath = Join-Path $DesktopPath "SetPrifix4URI.lnk"
$TergetBatchPath = Join-Path $PSScriptRoot "SetPrifix4URI.bat"

$WsShell = New-Object -ComObject WScript.Shell
$Shortcut = $WsShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TergetBatchPath
# $Shortcut.IconLocation = "C:\tools\procexp.exe"
$Shortcut.Save()
