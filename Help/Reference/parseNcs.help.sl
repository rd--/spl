# parseNcs

- _parseNcs(s)_

Parse a Natural Color System specifier.
An _NCS_ prefix is required,
an _S_ is allowed but not required.

Parse _0515-G40Y_:

```
>>> 'NCS S 0515-G40Y'.parseNcs
[05 15 'G' 40 'Y']

>>> let c = 'NCS 0515-G40Y'.parseNcs;
>>> (c.ncsToRgb * 255).floor
[234 255 193]
```

Parse _0580-Y10R_,
the yellow of the flag of Sweden:

```
>>> 'NCS S 0580-Y10R'.parseNcs
[05 80 'Y' 10 'R']

>>> let c = 'NCS 0580-Y10R'.parseNcs;
>>> (c.ncsToRgb * 255).floor
[255 202 32]
```

Parse _4055-R95B_:

```
>>> 'NCS S 4055-R95B'.parseNcs
[40 55 'R' 95 'B']

>>> let c = 'NCS 4055-R95B'.parseNcs;
>>> (c.ncsToRgb * 255).floor
[45 95 161]
```

* * *

See also: NcsColour, ncsToRgb

Guides: Colour Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Natural_Color_System)
