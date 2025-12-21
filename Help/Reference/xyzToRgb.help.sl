# xyzToRgb

- _xyzToRgb([x y z])_

Convert from Cie _Xyz_ tristimulus values in _(0,1)_ to an _Rgb_ colourspace array in _(0,1)_.

```
>>> let rgb = [0.25 0.40 0.10].xyzToRgb;
>>> (rgb, rgb.srgbEncode)
(
	[0.14541 0.51222 0.03802],
	[0.41743 0.74335 0.21514]
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
[1](https://mathworks.com/help/images/ref/xyz2rgb.html),
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.XYZ_to_RGB.html),
_W_
[1](https://en.wikipedia.org/wiki/CIE_1931_color_space)

Categories: Colour
