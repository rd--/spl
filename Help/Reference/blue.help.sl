# blue

- _blue(aColour | aNumber)_

At `Colour`,
answer the value of the _blue_ channel of _aColour_.
The value is in _(0,1)_.

```
>>> HsvColour([111, 0.5, 0.5], 1).blue
0.25
```

At `Number`,
answer a blue colour value with the alpha channel set to _aNumber_.

```
>>> 0.65.blue
RgbColour([0 0 1], 0.65)
```

* * *

See also: alpha, Colour, green, red, RgbColour

Guides: Colour Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Blue.html.en),
_W_
[1](https://en.wikipedia.org/wiki/Blue)

Categories: Colour
