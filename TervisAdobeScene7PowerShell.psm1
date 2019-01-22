function Get-TervisWebToPrintImageFromAdobeScene7WebToPrintURL {
    param (
        [uri]$RequestURI = "http://localhost:8080/is/agm/tervis/16_cstm_print?&setAttr.imgWrap={source=@Embed('is(tervisRender/16oz_wrap_final%3flayer=1%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))%26show%26res=300%26req=object%26fmt=png-alpha,rgb)%26fmt=png-alpha,rgb)')}&setAttr.maskWrap={source=@Embed()}&imageres=300&fmt=pdf,rgb&.v=76113"
    )
    $ProjectID = $RequestURI.OriginalString | 
    Get-GuidFromString

    $Scene7WebToPrintTemplateName = $RequestURI.Segments[-1]
    $SizeAndFormTypeParameter = Get-CustomyzerPrintImageTemplateSizeAndFormType  -PrintImageTemplateName $Scene7WebToPrintTemplateName |
    ConvertTo-HashTable

    $TervisInDesignServerWebToPrintPDFContentParameters = @{
        ColorImageURL = New-TervisAdobeScene7FinalImageURL @SizeAndFormTypeParameter -ProjectID $ProjectID
        WhiteInkImageURL = New-TervisAdobeScene7WhitInkImageURL -WhiteInkColorHex 000000 @SizeAndFormTypeParameter -ProjectID $ProjectID
    } + $SizeAndFormTypeParameter

    $Content = Get-TervisWebToPrintInDesignServerPDFContent @TervisInDesignServerWebToPrintPDFContentParameters
    $Content
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
        $ProjectID
    )
    "http://images.tervis.com/is/image/tervis/prj-$($ProjectID)?scl=1"
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
}

function New-TervisAdobeScene7WhitInkImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType,
        [ValidateSet("00A99C","000000")][String]$WhiteInkColorHex = "00A99C",
        [Switch]$OldWay
    )
    $GetTemplateNameParameters = $PSBoundParameters | ConvertFrom-PSBoundParameters -Property Size,FormType -AsHashTable
    if (-not $OldWay) {
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
    } elseif ($OldWay) {
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