# fromSphericalCoordinates

- _fromSphericalCoordinates(aSequence)_

Answers the _(x,y,z)_ Cartesian coordinates corresponding to the spherical coordinates _(r,θ,ϕ)_,
where θ is azimuth and ϕ is inclination.

```
>>> [3.sqrt, 0.25.pi, 2.sqrt.arcTan].fromSphericalCoordinates
[1 1 1]
```

Equivalent to:

```
>>> [3.sqrt, 0.25.pi, 2.sqrt.arcTan].asSphericalCoordinate.asCartesianCoordinate.asList
[1 1 1]
```

Note that this notation extends the usual polar coordinates notation,
with theta remaining the angle in the xy-plane and phi becoming the angle out of that plane.

```
>>> [2.sqrt, 0.25.pi, 1.arcSin].fromSphericalCoordinates
[1 1 0]

>>> [2.sqrt, 0.25.pi].fromPolarCoordinates
[1 1]
```

Collects over lists:

```
>>> [2.sqrt 0 0.25.pi; 2 pi 0.5.pi; 2.sqrt 0.5.pi 0.75.pi].fromSphericalCoordinates
[1 0 1; -2 0 0; 0 1 -1]
```

Inverse is `toSphericalCoordinates`:

```
>>> [3.sqrt, 0.25.pi, 2.sqrt.arcTan]
[1 1 1].toSphericalCoordinates
```

* * *

See also: arcTan, norm, fromPolarCoordinates, SphericalCoordinate, toSphericalCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FromSphericalCoordinates.html)
