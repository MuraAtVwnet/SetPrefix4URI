##############################################
# Set Prefix for URI
##############################################

# Prefix
$Prifix = '##CreatorID##'

# Display Contole
$DisplayURI = $true

[array]$URI = Get-Clipboard

if($DisplayURI ){
	Write-Output "Input URI  : $URI"
}

# Reject Facebook Prifix
$URI[$URI.Count -1] = $URI[$URI.Count -1] -replace "\?fbclid=.+\&", "?"
$URI[$URI.Count -1] = $URI[$URI.Count -1] -replace "\&fbclid=.+\&", "&"
$URI[$URI.Count -1] = $URI[$URI.Count -1] -replace "\?fbclid=.+", ""
$URI[$URI.Count -1] = $URI[$URI.Count -1] -replace "\&fbclid=.+", ""


# Add last /
#if($URI[$URI.Count -1][$URI[$URI.Count -1].Length -1] -ne "/"){
#	$URI[$URI.Count -1] += "/"
#}


# Found '?'
[array]$TempBuffers = $URI[$URI.Count -1].Split( '?' )
$TempBuffersCount = $TempBuffers.Count

if( $TempBuffersCount -ne 1 ){

	$TempBuffers1Len = $TempBuffers[1].Length
	$PrifixLen = $Prifix.Length -1
	if( $TempBuffers[1].Length -ge $PrifixLen ){
		$TestString = '?' + $TempBuffers[1].Substring( 0, $PrifixLen )
		if( $TestString -eq $Prifix){
			$TempBuffers[0] += '?' + $TempBuffers[1]
		}
		else{
			$TempBuffers[0] += $Prifix + '&' + $TempBuffers[1]
		}
	}
	else{
		$TempBuffers[0] += $Prifix + '&' + $TempBuffers[1]
	}

	for( $Index = 2 ; $Index -lt $TempBuffersCount; $Index++ ){
		$TempBuffers[0] +=	'?' + $TempBuffers[$Index]
	}

	$URI[$URI.Count -1] = $TempBuffers[0]
}
else{
	$URI[$URI.Count -1] += $Prifix
}

$URI | Set-Clipboard

if( $DisplayURI ){
	Write-Output "Output URI : $URI"
	Read-Host "Hit Enter"
}
