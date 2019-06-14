ipmo -force tervisCustomyzer
$SizeAndFormTypeToImageTemplateNames = Get-SizeAndFormTypeToImageTemplateNames |
Where-Object -Property ImageTemplateName |
Where-Object -Property FormType -Contains "SS"

foreach ($SizeAndFormTypeToImageTemplateName in $SizeAndFormTypeToImageTemplateNames) {
    foreach ($FormType in $SizeAndFormTypeToImageTemplateName.FormType) {
        Get-TervisAdboeScene7CustomyzerOrderNumberExampleImageURL -Size $SizeAndFormTypeToImageTemplateName.Size -FormType $FormType |
        Remove-WhiteSpace |
        out-GoogleChrome

        Get-TervisAdboeScene7CustomyzerTervisLogoImageURL -Size $SizeAndFormTypeToImageTemplateName.Size -FormType $FormType |
        Remove-WhiteSpace |
        out-GoogleChrome
    }
}