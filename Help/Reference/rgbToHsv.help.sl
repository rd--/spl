# rgbToHsv

- _rgbToHsv(rgb)_

Answer an _(h,s,v)_ triple given an _(r,g,b)_ triple.

Specific values:

```
>>> [0.45621 0.03081 0.04092].rgbToHsv
[0.99604 0.93246 0.45621]
```

Inverse is `hsvToRgb`:

```
>>> [0.99604 0.93246 0.45621].hsvToRgb
[0.45621 0.03081 0.04092]
```

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
_Python_
[1](https://colour.readthedocs.io/en/develop/generated/colour.RGB_to_HSV.html)
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/rgb2hsv.html)
