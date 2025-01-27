# red

- _red(aColour | aNumber)_

At `Colour`,
answer the value of the _red_ channel of _aColour_.
The value is in _(0,1)_.

```
>>> HsvColour([111 / 360, 0.5, 0.5], 1).red
0.2875
```

At `Number`,
answer a red colour value with the alpha channel set to _aNumber_.

```
>>> 0.65.red
RgbColour([1 0 0], 0.65)
```

* * *

See also: alpha, blue, Colour, green, RgbColour

Categories: Colour
