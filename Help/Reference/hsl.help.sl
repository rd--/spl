# hsl

- _hsl(c)_

Answer a triple of _hue_, _saturation_ and _lightness_.
_Hsl_ is a cylindrical-coordinate representation of points in an _Rgb_ colour model.

```
>>> RgbColour([0.75 1 0.75], 1).hsl
[1/3 1 7/8]
```

Threads over lists:

```
>>> [1.red 1.green 1.blue].hsl
[
	  0 1 1/2;
	1/3 1 1/2;
	2/3 1 1/2
]
```

* * *

See also: Colour, HslColour, hslToRgb, hue, RgbColour

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/HSL_and_HSV)

Categories: Converting, Colour
