# RgbColour

- _RgbColour([r g b], alpha)_

A `Type` representing a colour in the _Rgb_ colour space,
using red, blue and green components,
with an `alpha` channel.

```
>>> let c = RgbColour([1 0 0], 1);
>>> (c.rgbString, c.isRed)
('rgb(255,0,0)', true)
```

Plot as colour swatch,
a blue-green close to the Munsell blue-green:

~~~spl svg=A
RgbColour([0 0.65 0.61], 1)
~~~

![](sw/spl/Help/Image/RgbColour-A.svg)

* * *

See also: asColour, Colour, HsvColour, srgbEncode

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RGBColor.html),
_W_
[1](https://en.wikipedia.org/wiki/RGB_color_model)
