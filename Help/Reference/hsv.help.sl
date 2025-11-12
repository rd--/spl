# hsv

- _hsv(aColour)_

Answer a triple of _hue_, _saturation_ and _value_.
_Hsv_ is a cylindrical-coordinate representation of points in an _Rgb_ colour model.

```
>>> RgbColour([0.75, 1, 0.75], 1).hsv
[1/3 0.25 1]
```

Threads over lists:

```
>>> [1.red 1.green 1.blue].hsv
[0 1 1; 1/3 1 1; 2/3 1 1]
```

* * *

See also: Colour, HsvColour, hsvToRgb, hue, RgbColour

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/HSL_and_HSV)

Categories: Converting, Colour
