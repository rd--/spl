# xyzToRgb

- _xyzToRgb(xyz)_

Converts Cie 1931 Xyz values (2° observer) to (s)Rgb values.

```
>>> let rgb = [0.25 0.40 0.10].xyzToRgb;
>>> (rgb, rgb.srgbEncode)
(
	[0.145428 0.512232 0.038014],
	[0.417450 0.743363 0.215123]
)

>>> [0.25 0.40 0.10]
>>> .xyzToRgb
>>> .rgbToXyz
[0.25 0.40 0.10]
```

A 9×9 gradient over a subset of _L*u*v*_ colour space at _L*=50_,
with out of gamut values clipped:

~~~spl svg=A
let n = 9;
let u = (0 -- 1).discretize(n);
{ :i :j |
	[i * 0., i * 0.2, j * 0.2]
	.xyzToRgb
	.srgbEncode
}
.table(u, u)
.arrayPlot
~~~

![](sw/spl/Help/Image/luvToXyz-A.svg)

A slice of the _L*u*v*_ colour space at _L*=75_,
where `Image` replaces out of gamut colours with _transparent_:

~~~spl svg=B
let n = 100;
let u = (-100 -- 100).discretize(n);
{ :i :j |
	[75, j, i]
	.luvToXyz
	.xyzToRgb
	.srgbEncode
}
.table(u.negated, u)
.Image
~~~

![](sw/spl/Help/Image/luvToXyz-B.png)

* * *

See also: Colour, rgbToXyz, srgbEncode

Guides: Colour Functions

References:
_Mathworks_
[1](https://mathworks.com/help/images/ref/rgb2xyz.html),
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.XYZ_to_RGB.html),
_W_
[1](https://en.wikipedia.org/wiki/CIE_1931_color_space)
