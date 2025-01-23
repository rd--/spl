# srgbEncode

- _srgbEncode(aNumber)_

Encode linear _Rgb_ values to non-linear _Rgb_ values using the _Srgb_ colour component transfer function (Cctf).
Also called the companding or gamma function.

Plot curve:

~~~spl svg=A
(0 -- 1).functionPlot(
	srgbEncode:/1
)
~~~

![](sw/spl/Help/Image/srgbEncode-A.svg)

Inverse is identity:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	x.srgbEncode.srgbDecode
}
~~~

![](sw/spl/Help/Image/srgbEncode-B.svg)

* * *

See also: Colour, srgbDecode

References:
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.cctf_encoding.html),
_W_
[1](https://en.wikipedia.org/wiki/SRGB)
