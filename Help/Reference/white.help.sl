# white

- _white(x)_

At `Number`,
answer a white colour value with the alpha channel set to _x_:

```
>>> 0.65.white
RgbColour([1 1 1], 0.65)
```

Plot whites with increasing α:

~~~spl svg=A
[0, 0.1 .. 1].collect(white:/1)
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/white-A.svg)

* * *

See also: alpha, blue, Colour, green, red, RgbColour

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/White.html),
_W_
[1](https://en.wikipedia.org/wiki/White)

Categories: Colour
