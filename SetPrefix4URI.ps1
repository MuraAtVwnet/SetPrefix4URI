##############################################
# Set Prefix for URI
##############################################

# Prefix
$Prifix = '?Prifix'

# Display Contole
$DisplayURI = $true

[array]$URI = Get-Clipboard

if($DisplayURI ){
	Write-Output "Input URI : $URI"
}

# Reject Facebook Prifix
$URI[$URI.Count -1] = $URI[$URI.Count -1] -replace "\?fbclid=.+", ""

# Add last /
#if($URI[$URI.Count -1][$URI[$URI.Count -1].Length -1] -ne "/"){
#	$URI[$URI.Count -1] += "/"
#}

# Add Prifix
$URI[$URI.Count -1] += $Prifix

$URI | Set-Clipboard

if( $DisplayURI ){
	Write-Output "Output URI : $URI"
	Read-Host "Hit Enter"
}
