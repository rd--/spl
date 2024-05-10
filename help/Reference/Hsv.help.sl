# Hsv

- _Hsv(hue, saturation, value)_

Answer a `Colour` value given _hue_, in degrees, and _saturation_ and _value_, in _(0,1)_.
Hsv is a cylindrical-coordinate representations of points in an Rgb color model.

```
>>> Hsv(0, 0, 0).isBlack
true

>>> Hsv(0, 0, 1).isWhite
true

>>> Hsv(0, 1, 1).isRed
true

>>> Hsv(0, 1, 0.75).isRed
true

>>> Hsv(120, 1, 1).isGreen
true

>>> Hsv(120, 1, 0.5).isGreen
true

>>> Hsv(240, 1, 1).isBlue
true

>>> Hsv(240, 1, 0.5).isBlue
true

>>> Hsv(251.5, 0.887, 0.918)
Colour(0.25980, 0.10374, 0.918)

>>> Hsv(60, 1, 1).isYellow
true

>>> Hsv(180, 1, 1).isCyan
true

>>> Hsv(300, 1, 1).isMagenta
true

>>> Hsv(0, 0, 0.5).isGreyOf(0.5)
true

>>> Hsv(0, 0, 0.75).isGreyOf(0.75)
true
```

* * *

See also: Colour

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Hue.html),
_W_
[1](https://en.wikipedia.org/wiki/HSL_and_HSV)

