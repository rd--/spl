# black

- _black(x)_

At `Number`,
answer a black colour value with the alpha channel set to _x_:

```
>>> 0.65.black
RgbColour([0 0 1], 0.65)
```

Plot blacks with increasing α:

~~~spl svg=A
[0, 0.1 .. 1].collect(black:/1)
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/black-A.svg)

* * *

See also: alpha, Colour, green, red, RgbColour

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Black.html),
_W_
[1](https://en.wikipedia.org/wiki/Black)

Categories: Colour
