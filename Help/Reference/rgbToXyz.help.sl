# rgbToXyz

- _rgbToXyz(rgb)_

Converts (s)_Rgb_ values to CIE 1931 _Xyz_ values (2° observer).

```
>>> [1 1 1].rgbToXyz
[0.9505 1.0000 1.0891]

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

* * *

See also: Colour, srgbToLinear, xyzToRgb

Guides: Colour Functions

References:
_Python_:
[1](https://colour.readthedocs.io/en/develop/generated/colour.RGB_to_XYZ.html),
_Mathworks_
[1](https://mathworks.com/help/images/ref/rgb2xyz.html)
