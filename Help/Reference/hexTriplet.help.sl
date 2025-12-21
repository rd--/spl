# hexTriplet

- _hexTriplet(c)_

Answer the number sign prefixed two character per byte hexadecimal _Rgb_ notation string of the colour _c_.

If the _alpha_ channel is one it is not given:

```
>>> RgbColour([0.2 0.5 0.7], 1)
>>> .hexTriplet
'#3380B3'

>>> HsvColour([0.5 0.25 0.85], 1)
>>> .hexTriplet
'#A3D9D9'
```

If the _alpha_ channel is not `one` it is given:

```
>>> RgbColour([0.2 0.5 0.7], 0.9)
>>> .hexTriplet
'#3380B3E6'
```

* * *

See also: Colour, parseHexColour, parseHexTriplet, printString, RgbColour

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Web_colors)
