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

* * *

See also: Colour, rgbToXyz, srgbEncode

Guides: Colour Functions

References:
_Mathworks_
[1](https://mathworks.com/help/images/ref/rgb2xyz.html),
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.XYZ_to_RGB.html)
