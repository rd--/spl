# rgbToXyz

- _rgbToXyz(rgb)_

Convert _Rgb_ colourspace array to Cie _Xyz_ tristimulus values.

```
>>> [1 1 1].rgbToXyz
[0.9505 1.0000 1.0890]

>>> [1 1 1].rgbToXyz.xyzToRgb
[1 1 1]

>>> [0.145428 0.512232 0.038014]
>>> .rgbToXyz
[0.25 0.4 0.1]

>>> [0.417450 0.743363 0.215123]
>>> .srgbDecode
>>> .rgbToXyz
[0.25 0.4 0.1]
```

_Note_:
The _Srgb_ standard specifies the colours and relative intensities of the three primaries by defining the mapping between these values,
in linear brightness scale,
before the gamma encoding,
and the Cie _Xyz_ perceptual colour coordinates.

* * *

See also: Colour, srgbToLinear, xyzToRgb

Guides: Colour Functions

References:
_Python_:
[1](https://colour.readthedocs.io/en/develop/generated/colour.RGB_to_XYZ.html),
_Mathworks_
[1](https://mathworks.com/help/images/ref/rgb2xyz.html),
_W_
[1](https://en.wikipedia.org/wiki/SRGB)
