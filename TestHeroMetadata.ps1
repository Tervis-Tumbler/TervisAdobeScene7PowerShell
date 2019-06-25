ipmo -force tervisCustomyzer, TervisAdobeScene7PowerShell
$SizeAndFormTypes = Get-SizeAndFormType

foreach ($SizeAndFormType in $SizeAndFormTypes) {
    Get-TervisAdobeScene7VignetteContentsURL -Size $SizeAndFormType.Size -FormType $SizeAndFormType.FormType -VignetteType Stock
}
$Xml = irm https://images.tervis.com/ir/render/tervisRender/24WB1?req=contents
$Xml.vignette.contents.group.group
$Xml.vignette.contents.group.group | where id -eq lic | select -ExpandProperty object
$Xml.vignette.contents.group.group | fl *
$Xml.vignette.contents.group.group |
where id -eq ACCESSORIES |
select -ExpandProperty group |
where id -eq LIDTRV |
Select-Object -ExpandProperty group | measure
fl *

Get-SizeAndFormTypeTravelLids -Size 24 -FormType WB | measure


