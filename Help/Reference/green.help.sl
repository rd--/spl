# green

- _green(aColour | aNumber)_

At `Colour`,
answer the value of the _green_ channel of _aColour_.
The value is in _(0,1)_.

```
>>> HsvColour([111 / 360, 0.5, 0.5], 1).green
0.5
```

At `Number`,
answer a green colour value with the alpha channel set to _aNumber_.

```
>>> 0.65.green
RgbColour([0 1 0], 0.65)
```

* * *

See also: alpha, blue, Colour, red

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Green.html.en),
_W_
[1](https://en.wikipedia.org/wiki/Green)

Categories: Colour
