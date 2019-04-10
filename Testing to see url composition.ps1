
$ProjectID = "8d47321e-dfea-4f98-ae86-8a57c85a78ad"
$ProjectID = "e5d6aaa1-f97e-4599-9a25-42d49b533409"

Set-PasswordstateComputerName -ComputerName passwordstate.tervis.com
Set-CustomyzerModuleEnvironment -Name Production
$Project = Get-CustomyzerProject -ProjectID $ProjectID

Get-TervisWebToPrintImage -ProjectID "e5d6aaa1-f97e-4599-9a25-42d49b533409"

$Project = Get-CustomyzerProject -ProjectID "e5d6aaa1-f97e-4599-9a25-42d49b533409"

$Project.PreviewImageDetails | Out-AdobeScene7UrlPrettyPrint
$Project.PreviewFlatImageLocation

@"
PreviewImageDetails
PreviewFlatImageLocation
FinalVingetteImageLocation
FinalFlatImageLocation
FinalArchedImageLocation
ArtboardFlatImageLocation
"@ -split "`r`n" |
ForEach-Object {
    $_
    $Project."$_" | 
    Out-AdobeScene7UrlPrettyPrint
    "`r`n"
}

$Project.PreviewFlatImageLocation | Out-TervisAdobeScene7UrlPrettyPrint

ipmo -force TervisAdobeScene7PowerShell, AdobeScene7PowerShell

$String = $Project.PreviewFlatImageLocation