@"
http://images.tervis.com/is/image/tervisRender?`$img-src2=tervisRender/16oz_blank&`$ordersize=600,101&`$orderhide=1&layer=0&size=2717,1750&anchor=0,0&layer=1&src=`$img-src2`$&anchor=0,0&layer=9999&src=is{tervisRender/logo_ordernum}&size=`$ordersize`$&rotate=90&posN=0,1&anchorn=0.5,0.5&hide=`$orderhide`$&pos=50,1696&`$orderhide=0&fmt=png-alpha&scl=1
"@ | Out-AdobeScene7UrlPrettyPrint | Out-GoogleChrome

#700x118
@"
http://images.tervis.com/is/image/tervisRender/logo_ordernum?scl=1
"@

@"
http://images.tervis.com/is/image/tervisRender?
`$img-src2=tervisRender/16oz_blank
&`$ordersize=600,101
&`$orderhide=1
&layer=0
&size=2717,1750
&anchor=0,0
&layer=1
&src=`$img-src2`$
&anchor=0,0
&layer=9999
&src=is{
    tervisRender/logo_ordernum
}
&size=`$ordersize`$
&rotate=90
&posN=0,1
&anchorn=0.5,0.5
&hide=`$orderhide`$
&pos=50,1696
&`$orderhide=0
&fmt=png-alpha
&scl=1
&layer=9999
&clipPath=
    M 0,300
    l200,0 
    l0,400 
    l-200,0
"@ | Remove-WhiteSpace | Out-GoogleChrome
