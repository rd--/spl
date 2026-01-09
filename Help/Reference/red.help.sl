# red

- _red(x)_

At `Colour`,
answer the value of the _red_ channel of the colour _x_.
The value is in _(0,1)_.

```
>>> HsvColour([111 / 360, 0.5, 0.5], 1).red
0.2875
```

At `Number`,
answer a red colour value with the alpha channel set to _x_:

```
>>> 0.65.red
RgbColour([1 0 0], 0.65)
```

Plot reds with increasing α:

~~~spl svg=A
[0, 0.1 .. 1].collect(red:/1)
.enclose
.arrayPlot
~~~

![](sw/spl/Help/Image/red-A.svg)

* * *

See also: alpha, blue, Colour, green, RgbColour

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Red.html),
_W_
[1](https://en.wikipedia.org/wiki/Red)

Categories: Colour
