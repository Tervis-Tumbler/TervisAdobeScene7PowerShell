"http://images.tervis.com/is/image/tervisRender/16oz_base2?layer=6&src=is(tervisRender/crop_image?`$img=8b4b07c2-2d4e-4750-9f6a-acbbc9c76233-test&`$size=2625.29,2019.45&$imgsize=2625.29,2019.45&$imgpos=1312.64,1009.73&$imgrotation=0&.i=275)&pos=1372.01,1016.71&rotate=0.00&fmt=png-alpha,rgb&qlt=85,1&$orderhide=1"

ipmo -force TervisAdobeScene7PowerShell
$URL = New-TervisAdobeScene7FinalImageURL -ProjectID "178d484b-d31a-4aa9-a4b7-5ec122a3c9ab" -Size 16 -FormType DWT
New-TervisAdobeScene7BaseImageURL -ProjectID "178d484b-d31a-4aa9-a4b7-5ec122a3c9ab" -Size 16 -FormType DWT
New-TervisAdobeScene7CustomyzerArtboardImageURL -ProjectID "178d484b-d31a-4aa9-a4b7-5ec122a3c9ab"

$URL = New-TervisAdobeScene7WhitInkImageURL -WhiteInkColorHex 000000 -Size 16 -FormType DWT -ProjectID "178d484b-d31a-4aa9-a4b7-5ec122a3c9ab"

$URL | Expand-TervisAdobeScene7ImageTemplateInString | Out-AdobeScene7UrlPrettyPrint
$URL | Out-AdobeScene7UrlPrettyPrint


$ProjectID = "8863258f-2911-412c-90c5-7eb7831164f6"

New-TervisAdobeScene7FinalImageURL -ProjectID $ProjectID -Size 16 -FormType BEER |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint

New-TervisAdobeScene7ColorInkImageURL -ProjectID $ProjectID -Size 16 -FormType BEER |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint |
Remove-WhiteSpace |
Out-GoogleChrome

New-TervisAdobeScene7WhitInkImageURL -ProjectID $ProjectID -Size 16 -FormType BEER |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint |
Remove-WhiteSpace |
Out-GoogleChrome

New-TervisAdobeScene7FinalImageURL -ProjectID $ProjectID -Size 10 -FormType WAV |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint

New-TervisAdobeScene7WhitInkImageURL -ProjectID $ProjectID -Size 10 -FormType WAV |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint



$ProjectID = "69ad18c4-610a-4110-b018-48242f71cb0f" #BeerMugLove

New-TervisAdobeScene7ColorInkImageURL -ProjectID $ProjectID -Size 16 -FormType BEER |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint

New-TervisAdobeScene7WhitInkImageURL -ProjectID $ProjectID -Size 16 -FormType BEER |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint




New-TervisAdobeScene7FinalImageURL -ProjectID "178d484b-d31a-4aa9-a4b7-5ec122a3c9ab" -Size 16 -FormType DWT |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint

New-TervisAdobeScene7WhitInkImageURLOld -ProjectID "178d484b-d31a-4aa9-a4b7-5ec122a3c9ab" -Size 16 -FormType DWT |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint

New-TervisAdobeScene7ColorInkImageURL -ProjectID "178d484b-d31a-4aa9-a4b7-5ec122a3c9ab" -Size 16 -FormType DWT |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint

New-TervisAdobeScene7WhitInkImageURL -ProjectID "178d484b-d31a-4aa9-a4b7-5ec122a3c9ab" -Size 16 -FormType DWT |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint


