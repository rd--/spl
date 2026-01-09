# ncsToRgb

- _ncsToRgb([s c h₁ h₂ h₃])_

Convert an Ncs colour specifier where
_s_ is blackness,
_c_ is chromaticness,
and _h_ is hue,
to an _(r,g,b)_ triple.

```
>>> [40 55 'R' 95 'B'].ncsToRgb
[0.17805 0.37644 0.63250]

>>> [05 80 'Y' 10 'R'].ncsToRgb
[1.00000 0.79513 0.12822]
```

* * *

See also: NcsColour, parseNcs

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Natural_Color_System)
