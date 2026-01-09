# blue

- _blue(x)_

At `Colour`,
answer the value of the _blue_ channel of _x_.
The value is in _(0,1)_.

```
>>> HsvColour([111 0.5 0.5], 1)
>>> .blue
0.25
```

At `Number`,
answer a blue colour value with the alpha channel set to _x_:

```
>>> 0.65.blue
RgbColour([0 0 1], 0.65)
```

Plot blues with increasing α:

~~~spl svg=A
[0, 0.1 .. 1].collect(blue:/1)
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/blue-A.svg)

* * *

See also: alpha, Colour, green, red, RgbColour

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Blue.html),
_W_
[1](https://en.wikipedia.org/wiki/Blue)

Categories: Colour
