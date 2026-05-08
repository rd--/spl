# greyLevel

- _greyLevel(n, α=1)_

Answer a colour in the greyscale color space with grey level _n_ and alpha transparency _α_.

```
>>> 0.5.greyLevel(0.75)
RgbColour([0.5 0.5 0.5], 0.75)
```

Black with _α=0.5_:

```
>>> 0.greyLevel(0.5)
0.5.black
```

White with _α=0.5_:

```
>>> 1.greyLevel(0.5)
0.5.white
```

The unary form:

```
>>> 0.5.greyLevel
RgbColour([0.5, 0.5, 0.5], 1)
```

Plot a 10×10 matrix of varying shades of grey and alpha:

~~~spl svg=A
let i = (0 -- 1).subdivide(9);
greyLevel:/2
.table(i, i)
.rgba
.arrayPlot
~~~

![](Help/Image/greyLevel-A.svg)

* * *

See also: black, blue, Colour, green, hue, red, RgbColour, white

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GrayLevel.html)
