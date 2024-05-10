# toPolarCoordinates

- _toPolarCoordinates(aSequence)_

Answers the _(r,θ)_ polar coordinates corresponding to the Cartesian coordinates _(x,y)_.

```
>>> [1 1].toPolarCoordinates
[2.sqrt 0.25.pi]

>>> (-1, -1).toPolarCoordinates
[2.sqrt -0.75.pi]
```

Collects over lists:

```
>>> [1 0; -2 0; 0 1].toPolarCoordinates
[1 0; 2 pi; 1 0.5.pi]
```

`toPolarCoordinates` converts pairs of real numbers to their polar representation:

```
>>> [1 2].toPolarCoordinates
[5.sqrt, 2.arcTan]
```

`absArg` converts complex numbers to their polar representation:

```
>>> 1j2.absArg
[5.sqrt 2.arcTan]
```

* * *

See also: absArg, arcTan, norm, toSphericalCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToPolarCoordinates.html)
