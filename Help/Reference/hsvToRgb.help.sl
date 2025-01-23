# hsvToRgb

- _hsvToRgb(hsv)_

Convert from _Hsv_ _(0,1)_ colourspace to _Rgb_ _(0,1)_ colourspace.
Answer an _(r,g,b)_ triple given an _(h,s,v)_ triple.

At specific value:

```
>>> [0.99604 0.93246 0.45621].hsvToRgb
[0.45621 0.03081 0.04092]
```

Inverse is `rgbToHsv`:

```
>>> [0.45621 0.03081 0.04092].rgbToHsv
[0.99604 0.93246 0.45621]
```

Convert table of _Hsv_ values to _Rgb_.

```
>>> let hsv = [
>>> 	0     1   1;
>>> 	1/12  1   1;
>>> 	1/6   1   1;
>>> 	1/3   1   1;
>>> 	2/3   1   1;
>>> 	7/9   1   1
>>> ];
>>> hsv.collect(hsvToRgb:/1)
[
	1   0   0;
	1   1/2 0;
	1   1   0;
	0   1   0;
	0   0   1;
	2/3 0   1
]
```

A colour drawing of an 5×5 matrix with the _hue_ parameter linearly rotating in row order:

~~~spl svg=A
let n = 5;
[n n].iota.deepCollect { :each |
	[each / n / n, 0.65, 0.75].hsvToRgb
}.arrayPlot
~~~

![](sw/spl/Help/Image/hsvToRgb-A.svg)

A colour drawing of an 9×9 gradient matrix with the _hue_ parameter traversing _(0,1)_ and the _value_ parameter _(0.3, 1)_:

~~~spl svg=B
let n = 9;
let i = (0 -- 1).discretize(n);
{ :h :v |
	[h, 0.5, v].hsvToRgb
}.table(i, i * 0.7 + 0.3).arrayPlot
~~~

![](sw/spl/Help/Image/hsvToRgb-B.svg)

An image of the same gradient matrix at higher resolution:

~~~spl png=C
let n = 99;
let i = (0 -- 1).subdivide(n);
{ :h :v |
	[h, 0.5, v].hsvToRgb
}.table(i, i * 0.7 + 0.3).Image
~~~

![](sw/spl/Help/Image/hsvToRgb-C.png)

* * *

See also: Colour, Hsv, hslToHsv, hslToRgb, hsv, hsvToHsl, hue, rgbToHsv

Guides: Colour Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/hsv2rgb.html),
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.HSV_to_RGB.html)

Categories: Colour
