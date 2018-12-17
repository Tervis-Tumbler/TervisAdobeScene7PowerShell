# function Get-TervisAdobeScene7

function Get-TervisWebToPrintImageFromAdobeScene7WebToPrintURL {
    param (
        [uri]$RequestURI = "http://localhost:8080/is/agm/tervis/16_cstm_print?&setAttr.imgWrap={source=@Embed('is(tervisRender/16oz_wrap_final%3flayer=1%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))%26show%26res=300%26req=object%26fmt=png-alpha,rgb)%26fmt=png-alpha,rgb)')}&setAttr.maskWrap={source=@Embed()}&imageres=300&fmt=pdf,rgb&.v=76113"
    )
    $ProjectID = $RequestURI.OriginalString | 
    Get-GuidFromString

    $Scene7CustomyzerArtboardImageURL = New-TervisAdobeScene7CustomyzerArtboardImageURL -ProjectID $ProjectID

    $Scene7WebToPrintTemplateName = $RequestURI.Segments[-1]
    $Scene7WebToPrintTemplateName

    $StringInScene7WebToPrintTemplateNameToSizeAndFormTypeMapping = @{
        16 = [PSCustomObject]@{
            Size = 16
            FormType = "DWT"
        }
    }
}

function Get-GuidFromString {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$InputString
    )
    process {
        $InputString | 
        ConvertFrom-StringUsingRegexCaptureGroup -Regex "(?<GUID>{?\w{8}-?\w{4}-?\w{4}-?\w{4}-?\w{12}}?)" |
        Select-Object -ExpandProperty GUID    
    }
}

function New-TervisAdobeScene7CustomyzerArtboardImageURL {
    param (
        $ProjectID
    )
    "http://images.tervis.com/is/image/tervis/prj-$ProjectID?scl=1"
}

function New-TervisAdobeScene7BaseImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType
    )
    
    $BaseTemplateName = Get-CustomyzerImageTemplateName -Size $Size -FormType $FormType |
    Select-Object -ExpandProperty Base
    "http://images.tervis.com/is/image/tervisRender/$($BaseTemplateName)?.BG&layer=5&anchor=0,0&src=is(tervis/prj-$ProjectID)&scl=1"
}

function New-TervisAdobeScene7VignetteImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType
    )
    $GetTemplateNameParameters = $PSBoundParameters | ConvertFrom-PSBoundParameters -Property Size,FormType -AsHashTable
    Get-CustomyzerImageTemplateName @GetTemplateNameParameters -TemplateType FinalWithERPNumber

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
"@ -replace "`r`n|`n|`r|`t| ", ""
}

function New-TervisAdobeScene7VignetteImageURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType
    )
    $ImageTemplateNames = Get-CustomyzerImageTemplateName -Size $Size -FormType $FormType

@"
http://images.tervis.com/is/image/tervisRender/$($ImageTemplateNames.Final)?
    layer=1&
    src=ir(
        tervisRender/$($ImageTemplateNames.Vignette)?
        &obj=group
        &decal
        &src=is(
            tervisRender/$($ImageTemplateNames.Base)?
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
"@ -replace "`r`n|`n|`r|`t| ", ""
}

function New-TervisAdobeScene7WhitInkMaskURL {
    param (
        [Parameter(Mandatory)]$ProjectID,
        [Parameter(Mandatory)]$Size,
        [Parameter(Mandatory)]$FormType,
        [ValidateSet("00A99C","000000")]$WhiteInkColorHex = "00A99C"
    )
    $ImageTemplateNames = Get-CustomyzerImageTemplateName -Size $Size -FormType $FormType
@"
http://images.tervis.com/is/image/tervis?
src=(
    http://images.tervis.com/is/image/tervisRender/$($ImageTemplateNames.Mask)?
    &layer=1
    &mask=is(
        tervisRender?
        &src=ir(
            tervisRender/$($ImageTemplateNames.Vignette)?
            &obj=group
            &decal
            &src=is(
                tervisRender/$($ImageTemplateNames.Base)?
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
"@ -replace "`r`n|`n|`r|`t| ", ""
}
function ConvertFrom-TervisAdobeScene7WebToPrintURL {
    param (
        [uri]$RequestURI = "http://localhost:8080/is/agm/tervis/16_cstm_print?&setAttr.imgWrap={source=@Embed('is(tervisRender/16oz_wrap_final%3flayer=1%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))%26show%26res=300%26req=object%26fmt=png-alpha,rgb)%26fmt=png-alpha,rgb)')}&setAttr.maskWrap={source=@Embed('http://images.tervis.com/is/image/tervis%3fsrc=(http://images.tervis.com/is/image/tervisRender/16oz_wrap_mask%3f%26layer=1%26mask=is(tervisRender%3f%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))%26show%26res=300%26req=object%26fmt=png-alpha)%26op_grow=-2)%26scl=1)%26scl=1%26fmt=png8%26quantize=adaptive,off,2,ffffff,00A99C')}&imageres=300&fmt=pdf,rgb&.v=76113"
    )
    $TemplateName = $RequestURI.Segments[-1]

    $QueryStringParameters = [System.Web.HttpUtility]::ParseQueryString($RequestURI.Query)
    $SetAttrKeys = $QueryStringParameters.keys |
    Where-Object {$_ -match "setAttr"}

    $SetAttrKeys | % {
        $QueryStringParameters[$_] | 
        Get-AdobeScene7URLSourceEmbedContent |
        ConvertTo-Scene7URL
    }

    [PSCustomObject]@{

        TemplateName = $RequestURI.Segments[-1]
    }
}

function ConvertTo-Scene7URL {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$AdobeScene7URLSourceEmbedContent
    )
    process {
        if ($AdobeScene7URLSourceEmbedContent.Substring(0,4) -eq "http") {
            $AdobeScene7URLSourceEmbedContent
        } else {
            "http://images.tervis.com/is/image/$AdobeScene7URLSourceEmbedContent"
            # $Uri = [uri]"http://images.tervis.com/is/image/$AdobeScene7URLSourceEmbedContent"
            # $URLEncodedQuery = ConvertTo-Scene7URLEncodedQueryStringParameterString -PipelineInput ([System.Web.HttpUtility]::ParseQueryString($Uri.Query))
            # "$($Uri.GetLeftPart("Path"))?$URLEncodedQuery"
        }
    }
}
function testing {
    

$QueryStringParameters = [System.Web.HttpUtility]::ParseQueryString($RequestURI.Query)

$QueryStringParameters.Keys | 
where {$_} | 
% {"$_ = " + $QueryStringParameters[$_]}

$ColorImageURLExpression = $QueryStringParameters["setAttr.imgWrap"] | Get-AdobeScene7URLSourceEmbedContent
$WhiteInkImageUrlExpression = $QueryStringParameters["setAttr.maskWrap"] | Get-AdobeScene7URLSourceEmbedContent


$Uri = [uri]$WhiteInkImageUrl

$URLEncodedQuery = ConvertTo-URLEncodedQueryStringParameterString -PipelineInput ([System.Web.HttpUtility]::ParseQueryString($Uri.Query))
$URLEncodedQuery = ConvertTo-Scene7URLEncodedQueryStringParameterString -PipelineInput ([System.Web.HttpUtility]::ParseQueryString($Uri.Query))

$FinalURL = "$($Uri.GetLeftPart("Path"))?$URLEncodedQuery"

"http://images.tervis.com/is/image/tervisRender/16oz_wrap_final?layer=1,5&src=ir(tervisRender/16_Warp_trans%3f,is(tervisRender/16oz_base2%3f.BG,is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))&obj=group&anchor=0,0&res=300&req=object&fmt=png-alpha,rgb),png-alpha,rgb"
"http://images.tervis.com/is/image/tervisRender/16oz_wrap_final?layer=1&src=ir(tervisRender/16_Warp_trans?&obj=group&decal&src=is(tervisRender/16oz_base2?.BG&layer=5&anchor=0,0&src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))&show&res=300&req=object&fmt=png-alpha,rgb)&fmt=png-alpha,rgb" | 
Replace-ContentValue -OldValue "&" -NewValue "%26" |
Replace-ContentValue -OldValue "?" -NewValue "%3f"

}

function ConvertTo-Scene7URLEncodedQueryStringParameterString {
    param (
        [Parameter(ValueFromPipeline)]$PipelineInput,
        [Switch]$MakeParameterNamesLowerCase
    )
    process {
        if ($PipelineInput.keys) {
            
            foreach ($Key in $PipelineInput.Keys) {
                if ($Key) {
                    if ($URLEncodedQueryStringParameterString) {
                        $URLEncodedQueryStringParameterString += "&"
                    }
                    
                    $ParameterName = if ($MakeParameterNamesLowerCase) {
                        $Key.ToLower()
                    } else {
                        $Key
                    }
    
                    $URLEncodedQueryStringParameterString += "$ParameterName=$(
                        $PipelineInput[$Key] | 
                        Replace-ContentValue -OldValue "&" -NewValue "%26" |
                        Replace-ContentValue -OldValue "?" -NewValue "%3f"
                    )"    
                }
            }
        }
    }
    end {
        $URLEncodedQueryStringParameterString
    }
}


# {source=@Embed('http://images.tervis.com/is/image/tervis?src=(http://images.tervis.com/is/image/tervisRender/16oz_wrap_mask?&layer=1&mask=is(tervisRender?&src=ir(tervisRender/16_Warp_trans?&obj=group&decal&src=is(tervisRender/16oz_base2?.BG&layer=5&anchor=0,0&src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))&show&res=300&req=object&fmt=png-alpha)&op_grow=-2)&scl=1)&scl=1&fmt=png8&quantize=adaptive,off,2,ffffff,00A99C')}
# $WhiteInkImageUrlExpression | ConvertFrom-Jso

# irm http://localhost:8080/is/agm/tervis/16_cstm_print?&setAttr.imgWrap={source=@Embed('is(tervisRender/16oz_wrap_final%3flayer=1%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))%26show%26res=300%26req=object%26fmt=png-alpha,rgb)%26fmt=png-alpha,rgb)')}&setAttr.maskWrap={source=@Embed('http://images.tervis.com/is/image/tervis%3fsrc=(http://images.tervis.com/is/image/tervisRender/16oz_wrap_mask%3f%26layer=1%26mask=is(tervisRender%3f%26src=ir(tervisRender/16_Warp_trans%3f%26obj=group%26decal%26src=is(tervisRender/16oz_base2%3f.BG%26layer=5%26anchor=0,0%26src=is(tervis/prj-61e070ad-3a16-4a5b-a038-69402c1e942f))%26show%26res=300%26req=object%26fmt=png-alpha)%26op_grow=-2)%26scl=1)%26scl=1%26fmt=png8%26quantize=adaptive,off,2,ffffff,00A99C')}&imageres=300&fmt=pdf,rgb&.v=76113

# irm http://localhost:8080/helloworld/test/things


function Get-AdobeScene7URLSourceEmbedContent {
    param (
        [Parameter(Mandatory,ValueFromPipeline)]$SourceEmbedExpression
    )
    process {
        $Content = $SourceEmbedExpression -replace "^{" `
            -replace "}$" `
            -replace "^source=@Embed\('" `
            -replace "'\)$"
        
        $Token = $Content -split "\(" | Select-Object -First 1
        if ($Token -eq "is") {
            $Content -replace "^is\(" -replace "\)$"
        } else {
            $Content
        }
    }
}