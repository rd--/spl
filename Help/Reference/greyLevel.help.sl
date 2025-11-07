# greyLevel

- _greyLevel(n, α)_

Answer a color in the grayscale color space with gray level _n_ and alpha transparency _α_.

```
>>> 0.5.greyLevel(0.75)
RgbColour([0.5 0.5 0.5], 0.75)
```

Plot a 10×10 matrix of varying shades of grey and alpha:

~~~spl svg=A
let i = (0 -- 1).subdivide(9);
greyLevel:/2
.table(i, i)
.rgba
.arrayPlot
~~~

![](sw/spl/Help/Image/greyLevel-A.svg)

* * *

See also: blue, Colour, green, red, RgbColour

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GrayLevel.html)
