# RgbColour

- _RgbColour([r g b], alpha=1)_

A `Type` representing a colour in the _Rgb_ colour space,
using red, blue and green components,
with an `alpha` channel.

```
>>> let c = RgbColour[1 0 0];
>>> (c.rgbString, c.isRed)
('rgb(255,0,0)', true)
```

Threads over lists:

```
>>> RgbColour[1 0 0; 0 1 0; 0 0 1].hue
[0 1/3 2/3]
```

Plot as colour swatch,
a blue-green close to the Munsell blue-green:

~~~spl svg=A
RgbColour[0 0.65 0.61]
~~~

![](Help/Image/RgbColour-A.svg)

A random shuffle of the 64-colour four-level pallette:

~~~spl svg=B
let r = Sfc32(368213);
let a = [0 1 2 3].tuples(3);
let b = a.fisherYatesShuffle(r);
RgbColour(b / 3).reshape([8 8])
.arrayPlot
~~~

![](Help/Image/RgbColour-B.svg)

* * *

See also: asColour, Colour, HsvColour, RybColour, srgbEncode

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RGBColor.html),
_W_
[1](https://en.wikipedia.org/wiki/RGB_color_model)
