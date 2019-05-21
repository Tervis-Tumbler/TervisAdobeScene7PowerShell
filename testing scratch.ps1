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

New-TervisAdobeScene7WhitInkImageURL -ProjectID $ProjectID -Size 16 -FormType BEER |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint

New-TervisAdobeScene7FinalImageURL -ProjectID $ProjectID -Size 10 -FormType WAV |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint

New-TervisAdobeScene7WhitInkImageURL -ProjectID $ProjectID -Size 10 -FormType WAV |
Expand-TervisAdobeScene7ImagePresetInString |
Expand-TervisAdobeScene7ImageTemplateInString |
Out-AdobeScene7UrlPrettyPrint


@"
http://images.tervis.com/is/image/tervisRender?
layer=0
    &size=3084,1873
    &color=ffffff
    &opac=0
&layer=1
    &size=3084,1873
    &$orderhide=1
&layer=1
&src=ir(
    tervisRender/16_Warp_trans?
    &obj=group
    &decal
    &src=is(
        tervisRender?
        &$img-src2=tervisRender/16oz_blank
        &$ordersize=600,101
        &$orderhide=1
        &layer=0
        &size=2717,1750
        &anchor=0,0
        &layer=1
        &src=$img-src2$
        &anchor=0,0
        &layer=9999
        &src=is{
            tervisRender/logo_ordernum
        }
        &size=$ordersize$
        &rotate=90
        &posN=0,1
        &anchorn=0.5,0.5
        &hide=$orderhide$
        &pos=50,1696
        &.BG
        &layer=5
        &anchor=0,0
        &src=is(
            tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab
        )
    )
    &show
    &res=300
    &req=object
    &fmt=png-alpha,rgb
)
&scl=1
&fmt=png-alpha,rgb
"@ | Remove-WhiteSpace

@"
http://images.tervis.com/is/image/tervisRender?
layer=0
    &size=3084,1873
    &opac=0
&layer=1
    &size=3084,1873
&layer=1
&src=ir(
    tervisRender/16_Warp_trans?
    &obj=group
    &decal
    &src=is(
        tervisRender?
        &layer=0
        &size=2717,1750
        &anchor=0,0
        &layer=5
        &anchor=0,0
        &src=is(
            tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab
        )
    )
    &show
    &res=300
    &req=object
    &fmt=png-alpha,rgb
)
&scl=1
&fmt=png-alpha,rgb
"@ | Remove-WhiteSpace

@"
http://images.tervis.com/is/image/tervisRender?
layer=0
    &size=3084,1873
    &opac=0
&layer=1
&src=ir(
    tervisRender/16_Warp_trans?
    &obj=group
    &decal
    &src=is(
        tervisRender?
        &layer=0
        &size=2717,1750
        &anchor=0,0
        &layer=5
        &anchor=0,0
        &src=is(
            tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab?
            &scl=1
            &fmt=png-alpha,rgb
        )
    )
    &show
    &res=300
    &req=object
    &fmt=png-alpha,rgb
)
&scl=1
&fmt=png-alpha,rgb
"@ | Remove-WhiteSpace

@"
http://images.tervis.com/is/image/tervisRender/16oz_wrap_final?
layer=1
&src=ir(
    tervisRender/16_Warp_trans?
    &obj=group
    &decal
    &src=is(
        tervisRender/16oz_base2?
        .BG
        &layer=5
        &anchor=0,0
        &src=is(
            tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab
        )
    )
    &show
    &res=300
    &req=object
    &fmt=png-alpha,rgb
)
&scl=1
&fmt=png-alpha,rgb
"@

http://images.tervis.com/is/image/tervisRender?layer=0&size=3084,1873&color=ffffff&opac=0&layer=1&src=tervisRender/1154195&size=3084,1873&$orderhide=1?layer=1&src=ir(tervisRender/16_Warp_trans?&obj=group&decal&src=is(tervisRender/&$img-src2=tervisRender/16oz_blank&$ordersize=600,101&$orderhide=1&layer=0&size=2717,1750&anchor=0,0&layer=1&src=$img-src2$&anchor=0,0&layer=9999&src=is{tervisRender/logo_ordernum}&size=$ordersize$&rotate=90&posN=0,1&anchorn=0.5,0.5&hide=$orderhide$&pos=50,1696?.BG&layer=5&anchor=0,0&src=is(tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab))&show&res=300&req=object&fmt=png-alpha,rgb)&scl=1&fmt=png-alpha,rgb
http://images.tervis.com/is/image/tervisRender?layer=0&size=3084,1873&color=ffffff&opac=0&layer=1&src=tervisRender/1154195&size=3084,1873&$orderhide=1
http://images.tervis.com/is/image/tervisRender?layer=0&size=3084,1873&color=ffffff&opac=0&layer=1&src=tervisRender/1154195&size=3084,1873&$orderhide=1layer=1&src=ir(tervisRender/16_Warp_trans?&obj=group&decal&src=is(tervisRender?&$img-src2=tervisRender/16oz_blank&$ordersize=600,101&$orderhide=1&layer=0&size=2717,1750&anchor=0,0&layer=1&src=$img-src2/16oz_base2?anchor=0,0&layer=9999&src=is{tervisRender/logo_ordernum}&size=$ordersize/16oz_base2?rotate=90&posN=0,1&anchorn=0.5,0.5&hide=$orderhide/16oz_base2?pos=50,1696.BG&layer=5&anchor=0,0&src=is(tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab))&show&res=300&req=object&fmt=png-alpha,rgb)&scl=1&fmt=png-alpha,rgb
http://images.tervis.com/is/image/tervisRender?layer=0&size=3084,1873&color=ffffff&opac=0&layer=1&src=tervisRender/1154195&size=3084,1873&$orderhide=1&layer=1&src=ir(tervisRender/16_Warp_trans?&obj=group&decal&src=is(tervisRender?&$img-src2=tervisRender/16oz_blank&$ordersize=600,101&$orderhide=1&layer=0&size=2717,1750&anchor=0,0&layer=1&src=$img-src2/16oz_base2?anchor=0,0&layer=9999&src=is{tervisRender/logo_ordernum}&size=$ordersize/16oz_base2?rotate=90&posN=0,1&anchorn=0.5,0.5&hide=$orderhide/16oz_base2?pos=50,1696&.BG&layer=5&anchor=0,0&src=is(tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab))&show&res=300&req=object&fmt=png-alpha,rgb)&scl=1&fmt=png-alpha,rgb

layer=0&size=3084,1873&color=ffffff&opac=0&layer=1&src=tervisRender/1154195&size=3084,1873&$orderhide=1

"http://images.tervis.com/is/image/tervisRender/16oz_wrap_final?layer=1&src=ir(tervisRender/16_Warp_trans?&obj=group&decal&src=is(tervisRender/16oz_base2?.BG&layer=5&anchor=0,0&src=is(tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab))&show&res=300&req=object&fmt=png-alpha,rgb)&scl=1&fmt=png-alpha,rgb" `
-replace "([\/]16oz_wrap_final[?])" , "?$($Templates."16oz_wrap_final")&"


@"
http://images.tervis.com/is/image/tervis?
src=(
    http://images.tervis.com/is/image/tervisRender/16oz_wrap_mask?
    &layer=1
    &mask=is(
        tervisRender?
        &src=ir(
            tervisRender/16_Warp_trans?
            &obj=group
            &decal
            &src=is(
                tervisRender/16oz_base2?
                .BG
                &layer=5
                &anchor=0,0
                &src=is(
                    tervis/prj-178d484b-d31a-4aa9-a4b7-5ec122a3c9ab
                )
            )
            &show
            &res=300
            &req=object
            &fmt=png-alpha
        )
    )
    &scl=1
)
&scl=1
&color=000000
&fmt=png,gray
&op_grow=-2
&quantize=adaptive,off,2,ffffff,000000
"@ | Remove-WhiteSpace