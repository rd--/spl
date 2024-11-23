# rgbToHsv

- _rgbToHsv([r,g,b])_

Answer an _[h,s,v]_ triple given an _[r,g,b]_ triple.

Convert table of _Rgb_ values to _Hsv_.

```
>>> let rgb = [
>>> 	1   0   0;
>>> 	1   1/2 0;
>>> 	1   1   0;
>>> 	0   1   0;
>>> 	0   0   1;
>>> 	2/3 0   1
>>> ];
>>> rgb.collect(rgbToHsv:/1)
[
	0     1   1;
	1/12  1   1;
	1/6   1   1;
	1/3   1   1;
	2/3   1   1;
	7/9   1   1
]
```

* * *

See also: Colour, Hsv, hsv, hsvToRgb, hue

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/rgb2hsv.html)
