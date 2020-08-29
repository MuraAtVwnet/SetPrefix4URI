##############################################
# Set Prefix for URI
##############################################

# Prefix
$Prifix = 'Prifix'

[array]$URI = Get-Clipboard

Write-Output "Input URI : $URI"

# Reject Facebook Prifix
$URI[$URI.Count -1] = $URI[$URI.Count -1] -replace "\?fbclid=.+", ""

# Add last /
if($URI[$URI.Count -1][$URI[$URI.Count -1].Length -1] -ne "/"){
	$URI[$URI.Count -1] += "/"
}

# Add Prifix
$URI[$URI.Count -1] += $Prifix

Write-Output "Output URI : $URI"

$URI | Set-Clipboard

Read-Host "Please Enter"
