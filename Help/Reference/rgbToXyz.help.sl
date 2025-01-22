# rgbToXyz

- rgbToXyz(rgb)_

Converts (s)Rgb values to CIE 1931 Xyz values (2° observer).

```
>>> [1 1 1].rgbToXyz
[0.9505 1.0000 1.0891]

>>> [1 1 1].rgbToXyz.xyzToRgb
[1 1 1]

>>> [0.145428 0.512232 0.038014]
>>> .rgbToXyz
[0.25 0.4 0.1]

>>> [0.417450 0.743363 0.215123]
>>> .srgbToLinear
>>> .rgbToXyz
[0.25 0.4 0.1]
```

* * *

See also: Colour, srgbToLinear, xyzToRgb

References:
_Mathworks_
[1](https://mathworks.com/help/images/ref/rgb2xyz.html)
