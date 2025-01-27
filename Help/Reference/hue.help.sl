# hue

- _hue(aColour)_

Answer a the _hue_ of _aColour_.
`hue` is the first element of `hsv`.

```
>>> RgbColour([0.75, 1, 0.75], 1).hue
1/3
```

Threads over lists:

```
>>> [1.red 1.green 1.blue].hue
[0 1 2] / 3
```

* * *

See also: Colour, Hsv, hsv, hsvToRgb

Categories: Accessing, Colour
