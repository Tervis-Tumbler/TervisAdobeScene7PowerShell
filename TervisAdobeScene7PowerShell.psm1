$ModulePath = if ($PSScriptRoot) {
    $PSScriptRoot
} else {
    (Get-Module -ListAvailable TervisAdobeScene7PowerShell).ModuleBase
}
. $ModulePath\Definition.ps1

function Get-TervisWebToPrintImageFromAdobeScene7WebToPrintURL {
    param (
        [uri]$RequestURI = "http://images.tervis.com/is/agm/tervis/6_cstm_print?&setAttr.imgWrap={source=@Embed(%27is(tervisRender/6oz_wrap_final%3flayer=1%26src=ir(tervisRender/6_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/6oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-aa1f3d62-dd31-411e-bc46-b7c963e77ae0))%26show%26res=300%26req=object%26fmt=png-alpha,rgb)%26fmt=png-alpha,rgb)%27)}&setAttr.maskWrap={source=@Embed(%27http://images.tervis.com/is/image/tervis%3fsrc=(http://images.tervis.com/is/image/tervisRender/6oz_wrap_mask%3f%26layer=1%26mask=is(tervisRender%3f%26src=ir(tervisRender/6_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/6oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-aa1f3d62-dd31-411e-bc46-b7c963e77ae0))%26show%26res=300%26req=object%26fmt=png-alpha)%26op_grow=-2)%26scl=1)%26scl=1%26fmt=png8%26quantize=adaptive,off,2,ffffff,00A99C%27)}&imageres=300&fmt=pdf,rgb&.v=72271&`$orderNum=11361062/2"
        #[uri]$RequestURI = "http://images.tervis.com/is/agm/tervis/16_cstm_print_mark?&setAttr.imgWrap={source=@Embed(%27is(tervisRender/16oz_wrap_final%3flayer=1%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-8d47321e-dfea-4f98-ae86-8a57c85a78ad))%26show%26res=300%26req=object%26fmt=png-alpha,rgb)%26fmt=png-alpha,rgb)%27)}&setAttr.maskWrap={source=@Embed(%27http://images.tervis.com/is/image/tervis%3fsrc=(http://images.tervis.com/is/image/tervisRender/16oz_mark_mask%3f%26layer=1%26mask=is(tervisRender%3f%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-8d47321e-dfea-4f98-ae86-8a57c85a78ad))%26show%26res=300%26req=object%26fmt=png-alpha)%26op_grow=-2)%26scl=1%26layer=2%26src=is(tervisRender/mark_mask_v1%3f%26layer=1%26mask=is(tervis/vum-8d47321e-dfea-4f98-ae86-8a57c85a78ad-66TU5O11)%26scl=1)%26scl=1)%26scl=1%26fmt=png8%26quantize=adaptive,off,2,ffffff,00A99C%27)}&setAttr.imgMark={source=@Embed(%27is(tervis/vum-8d47321e-dfea-4f98-ae86-8a57c85a78ad-66TU5O11)%27}&imageres=300&fmt=pdf,rgb&.v=3284}"
        #[uri]$RequestURI = "http://images.tervis.com/is/agm/tervis/SS20_cstm_print?&setAttr.imgWrap=%7bsource=@Embed(%27is(tervisRender/SS_20oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-e5d6aaa1-f97e-4599-9a25-42d49b533409)%26fmt=png-alpha,rgb)%27)%7d&setAttr.maskWrap=%7bsource=@Embed(%27http://images.tervis.com/is/image/tervis%3fsrc=(http://images.tervis.com/is/image/tervisRender/SS_20oz_wrap_mask%3f%26layer=1%26mask=is(tervisRender/SS_20oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-e5d6aaa1-f97e-4599-9a25-42d49b533409)))%26op_grow=1%26op_usm=5,250,255,0%26scl=1%26cache=off%27)%7d&imageres=300&fmt=pdf,cmyk&cache=off"
    )
    $ProjectID = $RequestURI.OriginalString |
    Get-GuidFromString

    Get-TervisWebToPrintImage -ProjectID $ProjectID
    
    # $Scene7WebToPrintTemplateName = $RequestURI.Segments[-1]
    # $SizeAndFormTypeParameter = Get-CustomyzerPrintImageTemplateSizeAndFormType -PrintImageTemplateName $Scene7WebToPrintTemplateName |
    # ConvertTo-HashTable

    # $VuMarkID = $RequestURI.OriginalString |
    # Get-TervisVuMarkIDFromString 
    
    # $VuMarkIDParameter = if ($VuMarkID) {
    #     @{VuMarkID = $VuMarkID}
    # } else {
    #     @{}
    # }

    # $QueryStringParaemters = $RequestURI.Query | ConvertFrom-URLEncodedQueryStringParameterString

    # $Parameters = @{
    #     ColorImageURL = New-TervisAdobeScene7FinalImageURL @SizeAndFormTypeParameter -ProjectID $ProjectID
    #     WhiteInkImageURL = New-TervisAdobeScene7WhitInkImageURL -WhiteInkColorHex 000000 @SizeAndFormTypeParameter -ProjectID $ProjectID @VuMarkIDParameter
    #     VuMarkImageURL = $(if ($VuMarkID) { New-TervisAdobeScene7VuMarkImageURL -VuMarkID $VuMarkID -ProjectID $ProjectID })
    #     OrderNumber = $(if ($SizeAndFormTypeParameter.FormType -ne "SS") {$QueryStringParaemters.'$OrderNum'})
    # } | Remove-HashtableKeysWithEmptyOrNullValues

    # $TervisInDesignServerWebToPrintPDFContentParameters = $Parameters + $SizeAndFormTypeParameter
    # Get-TervisWebToPrintInDesignServerPDFContent @TervisInDesignServerWebToPrintPDFContentParameters
}

function Get-TervisWebToPrintImage {
    param (
        [Parameter(Mandatory)]$ProjectID
    )
    $Project = Get-CustomyzerProject -ProjectID $ProjectID
    $FormType = $Project.Product.Form.FormType
    $Size = $Project.Product.Form.Size
    $SizeAndFormTypeParameter = @{
        Size = $Size
        FormType = $FormType
    }
    $VuMarkID = $Project.Project_ARAssetID.VumarkID

    $VuMarkIDParameter = if ($VuMarkID) {
        @{
            VuMarkID = "$ProjectID-$($Project.Project_ARAssetID.VumarkID)"
        }
    } else {
        @{}
    }
    
    $Parameters = @{
        ColorImageURL = New-TervisAdobeScene7FinalImageURL @SizeAndFormTypeParameter -ProjectID $ProjectID
        WhiteInkImageURL = New-TervisAdobeScene7WhitInkImageURL -WhiteInkColorHex 000000 @SizeAndFormTypeParameter -ProjectID $ProjectID @VuMarkIDParameter
        VuMarkImageURL = $(if ($VuMarkID) { New-TervisAdobeScene7VuMarkImageURL @VuMarkIDParameter })
        OrderNumber = $(if ($FormType -ne "SS") {$Project.OrderDetail.Order.ERPOrderNumber})
    } | Remove-HashtableKeysWithEmptyOrNullValues

    $TervisInDesignServerWebToPrintPDFContentParameters = $Parameters + $SizeAndFormTypeParameter

    Get-TervisWebToPrintInDesignServerPDFContent @TervisInDesignServerWebToPrintPDFContentParameters
}

function Get-TervisVuMarkIDFromString {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$InputString
    )
    process {
        $InputString | 
        ConvertFrom-StringUsingRegexCaptureGroup -Regex "(?<VuMarkID>{?\w{8}-?\w{4}-?\w{4}-?\w{4}-?\w{12}-?\w{8}}?)" |
        Where-Object -FilterScript { $_.VuMarkID } |
        Select-Object -ExpandProperty VuMarkID
    }
}

function ConvertTo-AdobeScene7RelativeURL {
    param (
        [Parameter(Mandatory,ValueFromPipeline)][uri]$URL,
        [Switch]$Convert
    )
    process {
        if ($Convert) {
            ($URL.Segments | Select-Object -Skip 3) -join ""
        } else {
            $URL.OriginalString
        }
    }
}

function New-TervisAdobeScene7CustomyzerArtboardImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID
    )
    "http://images.tervis.com/is/image/tervis/prj-$($ProjectID)?scl=1"
}

function New-TervisAdobeScene7VuMarkImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$VuMarkID
    )
    "http://images.tervis.com/is/image/tervis/vum-$($ProjectID)-$($VuMarkID)?scl=1&fmt=png-alpha,rgb"
}

function New-TervisAdobeScene7BaseImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType
    )
    
    $GetTemplateNameParameters = $PSBoundParameters | ConvertFrom-PSBoundParameters -Property Size,FormType -AsHashTable

    @"
http://images.tervis.com/is/image/tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
.BG
&layer=5
&anchor=0,0
&src=is(
    tervis/prj-$ProjectID
    )
&scl=1"
"@ | Remove-WhiteSpace
}

function New-TervisAdobeScene7VignetteImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType
    )
    $GetTemplateNameParameters = $PSBoundParameters | ConvertFrom-PSBoundParameters -Property Size,FormType -AsHashTable

    @"
http://images.tervis.com/ir/render/tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
    &obj=group
    &decal
    &src=is(
        tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
        .BG
        &layer=5
        &anchor=0,0
        &src=is(
            tervis/prj-$ProjectID
        )
    )
    &show
    &res=300
    &req=object
    &fmt=png-alpha,rgb
    &scl=1
"@ | Remove-WhiteSpace
}

function New-TervisAdobeScene7FinalImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType
    )
    $GetTemplateNameParameters = $PSBoundParameters | ConvertFrom-PSBoundParameters -Property Size,FormType -AsHashTable
    if ($FormType -ne "SS") {
@"
http://images.tervis.com/is/image/tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Final)?
layer=1&
src=ir(
    tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
    &obj=group
    &decal
    &src=is(
        tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
        .BG
        &layer=5
        &anchor=0,0
        &src=is(
            tervis/prj-$ProjectID
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
    } elseif ($FormType -eq "SS") {
        @"
http://images.tervis.com/is/image/tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
.BG
&layer=5
&anchor=0,0
&src=is(
    tervis/prj-$ProjectID
)
&scl=1
&fmt=png-alpha,rgb
"@ | Remove-WhiteSpace
    }
}

function New-TervisAdobeScene7WhitInkImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType,
        [ValidateSet("00A99C","000000")][String]$WhiteInkColorHex = "00A99C",
        $VuMarkID,
        [Switch]$OldWay
    )
    $GetTemplateNameParameters = $PSBoundParameters | ConvertFrom-PSBoundParameters -Property Size,FormType -AsHashTable
    if (-not $OldWay -and -not $VuMarkID -and $FormType -ne "SS") {
@"
http://images.tervis.com/is/image/tervis?
src=(
    http://images.tervis.com/is/image/tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Mask)?
    &layer=1
    &mask=is(
        tervisRender?
        &src=ir(
            tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
            &obj=group
            &decal
            &src=is(
                tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
                .BG
                &layer=5
                &anchor=0,0
                &src=is(
                    tervis/prj-$ProjectID
                )
            )
            &show
            &res=300
            &req=object
            &fmt=png-alpha
        )
        &op_grow=-2
    )
    &scl=1
)
&scl=1
&color=000000
&fmt=png,gray
&quantize=adaptive,off,2,ffffff,$WhiteInkColorHex
"@ | Remove-WhiteSpace
    } elseif ($OldWay -and -not $VuMarkID -and $FormType -ne "SS") {
@"
http://images.tervis.com/is/image/tervis?
src=(
    http://images.tervis.com/is/image/tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Mask)?
    &layer=1
    &mask=is(
        tervisRender?
        &src=ir(
            tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
            &obj=group
            &decal
            &src=is(
                tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
                .BG
                &layer=5
                &anchor=0,0
                &src=is(
                    tervis/prj-$ProjectID
                )
            )
            &show
            &res=300
            &req=object
            &fmt=png-alpha
        )
        &op_grow=-2
    )
    &scl=1
)
&scl=1
&fmt=png8
&quantize=adaptive,off,2,ffffff,00A99C
"@ | Remove-WhiteSpace
    } elseif ($VuMarkID -and $FormType -ne "SS") {
@"
http://images.tervis.com/is/image/tervis?
src=(
    http://images.tervis.com/is/image/tervisRender/16oz_mark_mask?
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
                    tervis/prj-$ProjectID
                )
            )
            &show
            &res=300
            &req=object
            &fmt=png-alpha
        )
        &op_grow=-2
    )
    &scl=1
    &layer=2
    &src=is(
        tervisRender/mark_mask_v1?
        &layer=1
        &mask=is(
            tervis/vum-$ProjectID-$VuMarkID
        )
        &scl=1
    )
    &scl=1
)
&scl=1
&fmt=png8
&quantize=adaptive,off,2,ffffff,00A99C
"@ | Remove-WhiteSpace
    } elseif (-not $OldWay -and -not $VuMarkID -and $FormType -eq "SS") {
@"
http://images.tervis.com/is/image/tervis?
src=(
    http://images.tervis.com/is/image/tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Mask)?
    &layer=1
    &mask=is(
        tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
        .BG
        &layer=5
        &anchor=0,0
        &src=is(
            tervis/prj-$ProjectID
        )
    )
    &scl=1
)
&op_grow=1
&op_usm=5,250,255,0
&scl=1
&cache=off
&fmt=png,gray
"@ | Remove-WhiteSpace
    }
}

# function ConvertFrom-TervisAdobeScene7WebToPrintURL {
#     param (
#         [uri]$RequestURI = "http://localhost:8080/is/agm/tervis/16_cstm_print?&setAttr.imgWrap={source=@Embed('is(tervisRender/16oz_wrap_final%3flayer=1%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))%26show%26res=300%26req=object%26fmt=png-alpha,rgb)%26fmt=png-alpha,rgb)')}&setAttr.maskWrap={source=@Embed('http://images.tervis.com/is/image/tervis%3fsrc=(http://images.tervis.com/is/image/tervisRender/16oz_wrap_mask%3f%26layer=1%26mask=is(tervisRender%3f%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))%26show%26res=300%26req=object%26fmt=png-alpha)%26op_grow=-2)%26scl=1)%26scl=1%26fmt=png8%26quantize=adaptive,off,2,ffffff,00A99C')}&imageres=300&fmt=pdf,rgb&.v=76113"
#     )
#     $TemplateName = $RequestURI.Segments[-1]

#     $QueryStringParameters = [System.Web.HttpUtility]::ParseQueryString($RequestURI.Query)
#     $SetAttrKeys = $QueryStringParameters.keys |
#     Where-Object {$_ -match "setAttr"}

#     $SetAttrKeys | % {
#         $QueryStringParameters[$_] | 
#         Get-AdobeScene7URLSourceEmbedContent |
#         ConvertTo-Scene7URL
#     }

#     [PSCustomObject]@{

#         TemplateName = $RequestURI.Segments[-1]
#     }
# }

# function ConvertTo-Scene7URL {
#     param (
#         [Parameter(Mandatory,ValueFromPipeline)]$AdobeScene7URLSourceEmbedContent
#     )
#     process {
#         if ($AdobeScene7URLSourceEmbedContent.Substring(0,4) -eq "http") {
#             $AdobeScene7URLSourceEmbedContent
#         } else {
#             "http://images.tervis.com/is/image/$AdobeScene7URLSourceEmbedContent"
#             # $Uri = [uri]"http://images.tervis.com/is/image/$AdobeScene7URLSourceEmbedContent"
#             # $URLEncodedQuery = ConvertTo-Scene7URLEncodedQueryStringParameterString -PipelineInput ([System.Web.HttpUtility]::ParseQueryString($Uri.Query))
#             # "$($Uri.GetLeftPart("Path"))?$URLEncodedQuery"
#         }
#     }
# }

function Get-TervisAdobeScence7ImageURLFromOrderDetail {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$OrderDetail,
        [Switch]$WhiteInk
    )
    process {
        $Parameters = $PSBoundParameters | ConvertFrom-PSBoundParameters -ExcludeProperty OrderDetail -AsHashTable
        Get-TervisAdobeScence7ImageURL -ProjectID $OrderDetail.ProjectID -Size $OrderDetail.Project.Product.Form.Size -FormType $OrderDetail.Project.Product.Form.FormType @Parameters #-ERPOrderNumber $OrderDetail.Order.ERPOrderNumber 
    }
}

function Get-TervisAdobeScence7ImageURL {
    param (
        $ERPOrderNumber,
        $ProjectID = "9e733f21-ca49-4ba1-8efa-ea07b4b6d63e",
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType,
        [Switch]$WhiteInk,
        $Thumbnail
    )
    $ImageServerRootURL = "https://images.tervis.com/is/image/tervis"
    $GetTemplateNameParameters = $PSBoundParameters | ConvertFrom-PSBoundParameters -Property Size,FormType -AsHashTable
    $ImageURLStringWithWhiteSpace = if ($ERPOrderNumber) {
        #https://marketing.adobe.com/resources/help/en_US/s7/is_ir_api/is_api/http_ref/c_command_reference.html
        if (-not $WhiteInk) {
            @"
$($ImageServerRootURL)?
layer=0
&src=is(
    tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType FinalWithERPNumber)?
    layer=1
    &src=ir(
        tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
        &obj=group
        &decal
        &src=is(
            tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
            .BG
            &layer=5
            &anchor=0,0
            &src=is(
                tervis/prj-$ProjectID
            )
        )
        &show
        &res=300
        &req=object
        &fmt=png-alpha,rgb
    )
)
&`$order_number=$ERPOrderNumber
&fmt=png-alpha,rgb
&scl=1
&printRes=300
"@
    
        } elseif ($WhiteInk) {
@"
$($ImageServerRootURL)?
layer=0
&src=is(
    tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Mask)?
    &layer=1
    &mask=is(
        tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType FinalWithERPNumber)?
        layer=1
        &src=is(
            tervisRender?
            &src=ir(
                tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
                &obj=group
                &decal
                &src=is(
                    tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
                    .BG
                    &layer=5
                    &anchor=0,0
                    &src=is(
                        tervis/prj-$ProjectID
                    )
                )
                &show
                &res=300
                &req=object
                &fmt=png-alpha
            )
            &op_grow=-2
        )
        &scl=1
    )
    &`$order_number=$ERPOrderNumber
)
&scl=1
&fmt=png8
&quantize=adaptive,off,2,ffffff,000000
&printRes=300
"@
        }
    } else {
        if (-not $WhiteInk) {
@"
$($ImageServerRootURL)?
layer=0
&src=is(
    tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Final)?
    layer=1&
    src=ir(
        tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
        &obj=group
        &decal
        &src=is(
            tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
            .BG
            &layer=5
            &anchor=0,0
            &src=is(
                tervis/prj-$ProjectID
            )
        )
        &show
        &res=300
        &req=object
        &fmt=png-alpha,rgb
    )
)
&fmt=png-alpha,rgb
&scl=1
&printRes=300
"@
        } elseif ($WhiteInk) {
@"
http://images.tervis.com/is/image/tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType WhiteInkMask)?
&layer=1
&mask=is(
    tervisRender?
    &src=ir(
        tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
        &obj=group
        &decal
        &src=is(
            tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
            .BG
            &layer=5
            &anchor=0,0
            &src=is(
                tervis/prj-$ProjectID
            )
        )
        &show
        &res=300
        &req=object
        &fmt=png-alpha
    )
    &op_grow=-2
)
&scl=1
&fmt=tif,gray
"@ |
Replace-ContentValue -OldValue "&" -NewValue "%26" |
Replace-ContentValue -OldValue "?" -NewValue "%3f"
   
# @"
# $($ImageServerRootURL)?
# layer=0
# &src=is(
#     tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Mask)?
#     &layer=1
#     &mask=is(
#         tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Final)?
#         layer=1
#         &src=is(
#             tervisRender?
#             &src=ir(
#                 tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Vignette)?
#                 &obj=group
#                 &decal
#                 &src=is(
#                     tervisRender/$(Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType Base)?
#                     .BG
#                     &layer=5
#                     &anchor=0,0
#                     &src=is(tervis/prj-$ProjectID)
#                 )
#                 &show
#                 &res=300
#                 &req=object
#                 &fmt=png-alpha
#             )
#             &op_grow=-2
#         )
#         &scl=1
#     )
# )
# &scl=1
# &fmt=png8
# &quantize=adaptive,off,2,ffffff,000000
# &printRes=300
# "@
        }
    }

    $ImageURL = $ImageURLStringWithWhiteSpace | Remove-WhiteSpace
    $ImageURL
}


function Expand-TervisAdobeScene7ImagePresetInString {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$String
    )
    begin {
        $ImagePresets = $TervisAdobeScene7ImagePresets.Keys | 
        ForEach-Object { 
            $TervisAdobeScene7ImagePresets."$_"
        }
    }
    process {
        foreach ($Preset in $ImagePresets.Keys) {
            $String = $String |
            Replace-ContentValue -OldValue "`$$Preset`$" -NewValue $ImagePresets.$Preset
        }
    }
    end {
        $String
    }
}

function Out-TervisAdobeScene7UrlPrettyPrint {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$URL
    )
    process {
        $URLExpanded = $URL | Expand-TervisAdobeScene7ImagePresetInString
        $URLExpanded | Out-AdobeScene7UrlPrettyPrint
    }
}

function Invoke-TervisAdobeScene7ImagePresetAnalysis {
    $Objects = $TervisAdobeScene7ImagePresets.tervisRender.keys |
    ForEach-Object {
        $TervisAdobeScene7ImagePresets.tervisRender."$_" |
        ConvertFrom-URLEncodedQueryStringParameterString |
        Add-Member -MemberType NoteProperty -Name Name -Value $_ -Force -PassThru 
    }
    
    $Objects |
    Sort-Object -Property Name |
    Select-Object -Property Name,* -ErrorAction SilentlyContinue |
    Format-Table
}