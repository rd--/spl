# toPolarCoordinates

- _toPolarCoordinates([x y])_

Answers the _(r,θ)_ polar coordinates corresponding to the Cartesian coordinates _(x,y)_.
The angle is give in radians in _(-π,π)_.

At `List`:

```
>>> [1 1].toPolarCoordinates
[2.sqrt 1/4.pi]

>>> [-1 -1].toPolarCoordinates
[2.sqrt -3/4.pi]
```

Collects over lists:

```
>>> [1 0; -2 0; 0 1].toPolarCoordinates
[1 0; 2 1.pi; 1 1/2.pi]

>>> 6.circlePoints([0 0], 1, 0)
>>> .toPolarCoordinates
>>> .collect(second:/1)
[0 1/3 2/3 1 -2/3 -1/3].pi
```

`toPolarCoordinates` converts pairs of real numbers to their polar representation:

```
>>> [1 2].toPolarCoordinates
[5.sqrt, 2.arcTan]
```

`absArg` converts complex numbers to their polar representation:

```
>>> 1J2.absArg
[5.sqrt 2.arcTan]
```

* * *

See also: absArg, arcTan, fromPolarCoordinates, norm, PolarCoordinates, toSphericalCoordinates

Guides: Coordinate System Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToPolarCoordinates.html)

Categories: Converting, Geometry
