# xyzToRgb

- xyzToRgb(xyz)_

Converts Cie 1931 Xyz values (2° observer) to (s)Rgb values.

```
>>> let rgb = [0.25 0.40 0.10].xyzToRgb;
>>> (rgb, rgb.srgbFromLinear)
(
	[0.145428 0.512232 0.038014],
	[0.417450 0.743363 0.215123]
)

>>> [0.25 0.40 0.10].xyzToRgb.rgbToXyz
[0.25 0.40 0.10]
```

* * *

See also: Colour, rgbToXyz, srgbFromLinear

References:
_Mathworks_
[1](https://mathworks.com/help/images/ref/rgb2xyz.html)
