# hsvToRgb

- _hsvToRgb([h,s,v])_

Answer a _[r,g,b]_ triple given an _[h,s,v]_ triple.

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

A colour drawing of an 8×8 matrix with the _hue_ parameter linearly rotating in row order:

~~~spl svg=A
(0 -- 1).discretize(64).collect { :each |
	Hsv(each, 0.65, 0.75)
}.reshape([8 8]).asColourSvg
~~~

![](sw/spl/Help/Image/hsvToRgb-A.svg)

* * *

See also: Colour, Hsv, hsv, hue, rgbToHsv

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/hsv2rgb.html)
