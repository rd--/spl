# lchToLuv

Convert from _Lchuv_ colourspace to _Luv_ colourspace.
This is equalivalent to both `jchToJab` and `lchToLab`.

```
>>> [41.52788 59.12426 27.08849]
>>> .lchToLuv
[41.52788 52.63858 26.92318]
```

The inverse is `luvToLch`:

```
>>> [41.52788 52.63858 26.92318]
>>> .luvToLch
[41.52788 59.12426 27.08849]
```

A colour drawing of an 9×9 gradient matrix with the _hue_ parameter traversing _(0,360)_ and the _chroma_ parameter _(30,100)_,
out of gamut values are clipped:

~~~spl svg=A
let n = 9;
let u = (0 -- 1).discretize(n);
{ :h :c |
	[60, c * 70 + 30, h * 360]
	.lchToLuv
	.luvToXyz
	.xyzToRgb
	.clip([0 1])
	.srgbEncode
}.table(u, u).arrayPlot
~~~

![](sw/spl/Help/Image/lchToLuv-A.svg)

* * *

See also: Colour, hslToRgb, hsvToRgb, jchToJab, luvToLch

Guides: Colour Functions

References:
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.LCHuv_to_Luv.html)

Categories: Colour
