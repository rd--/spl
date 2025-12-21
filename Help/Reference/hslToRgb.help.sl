# hslToRgb

- _hslToRgb([h s l])_

Convert from _Hsl_ _(0,1)_ colourspace to _Rgb_ _(0,1)_ colourspace.
Answer an _(r,g,b)_ triple given an _(h,s,l)_ triple.

```
>>> [0.5 1 0.25].hslToRgb
[0 0.5 0.5]

>>> [0 0.5 0.5].rgbToHsl
[0.5 1 0.25]

>>> [0.99604 0.87347 0.24351].hslToRgb
[0.45621 0.03081 0.04092]
```

Inverse is `rgbToHsl`:

```
>>> [0.45621 0.03081 0.04092].rgbToHsl
[0.99604 0.87347 0.24351]
```

A colour drawing of an 5×5 matrix with the _hue_ parameter linearly rotating in row order:

~~~spl svg=A
let n = 5;
[n n].iota.deepCollect { :each |
	[each / n / n, 0.65, 0.65].hslToRgb
}.arrayPlot
~~~

![](sw/spl/Help/Image/hslToRgb-A.svg)

A colour drawing of an 9×9 gradient matrix with the _hue_ parameter traversing _(0,1)_ and the _value_ parameter _(0.3, 0.8)_:

~~~spl svg=B
let n = 9;
let i = (0 -- 1).discretize(n);
{ :h :l |
	[h, 0.5, l].hslToRgb
}.table(i, i * 0.5 + 0.3).arrayPlot
~~~

![](sw/spl/Help/Image/hslToRgb-B.svg)

An image of the same gradient matrix at higher resolution:

~~~spl png=C
let n = 99;
let i = (0 -- 1).subdivide(n);
{ :h :l |
	[h, 0.5, l].hslToRgb
}.table(i, i * 0.5 + 0.3).Image
~~~

![](sw/spl/Help/Image/hslToRgb-C.png)

A gradient at _s=1_ where
_h_ is _(0,1)_ along the _X_-axis,
and _l_ is _(0.2,0.8)_ along the _Y_-axis:

~~~spl png=D
{ :l :h |
	[h, 1, 1 - l].hslToRgb
}.table(
	(0.2 -- 0.8).discretize(75),
	(0 -- 1).discretize(250)
).Image
~~~

![](sw/spl/Help/Image/hslToRgb-D.png)

* * *

See also: hslToHsv, hsvToHsl, hsvToRgb, rgbToHsl, rgbToHsv

References:
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.HSL_to_RGB.html),
_W_
[1](https://en.wikipedia.org/wiki/HSL_and_HSV)
