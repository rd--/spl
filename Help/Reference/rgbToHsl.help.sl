# rgbToHsl

- _rgbToHsl([r g b])_

Convert from _Rgb_ _(0,1)_ colourspace to _Hsl_ _(0,1)_ colourspace.
Answer an _(h,s,l)_ triple given an _(r,g,b)_ triple.

```
>>> [0 0.5 0.5].rgbToHsl
[0.5 1 0.25]

>>> [0.5 1 0.25].hslToRgb
[0 0.5 0.5]

>>> [0.45621 0.03081 0.04092].rgbToHsl
[0.99604 0.87347 0.24351]
```

Inverse is `hslToRgb`:

```
>>> [0.99604 0.87347 0.24351].hslToRgb
[0.45621 0.03081 0.04092]
```

* * *

See also: hslToHsv, hslToRgb, rgbToHsv

References:
_Python_
[1](https://colour.readthedocs.io/en/latest/generated/colour.RGB_to_HSL.html),
_W_
[1](https://en.wikipedia.org/wiki/HSL_and_HSV)
