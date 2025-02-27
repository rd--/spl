# toSphericalCoordinates

- _toSphericalCoordinates(aSequence)_

Answers the _(r,θ,ϕ)_ spherical coordinates corresponding to the Cartesian coordinates _(x,y,z)_,
where θ is azimuth & ϕ is inclination.
Answers are in the range _(r > 0, -1.pi < θ < 1.pi, 0 < ϕ < 1.pi)_.

At `List`:

```
>>> [1 1 1].toSphericalCoordinates
[3.sqrt, 0.25.pi, 2.sqrt.arcTan]

>>> [-1 -1 -1].toSphericalCoordinates
[3.sqrt, -0.75.pi, -1.arcTan(2.sqrt)]
```

Equations are:

```
>>> let [x, y, z] = { system.nextRandomFloat } ! 3;
>>> let r = (x.squared + y.squared + z.squared).sqrt;
>>> let theta = x.arcTan(y);
>>> let phi = z.arcTan((x.squared + y.squared).sqrt);
>>> [x y z].toSphericalCoordinates
[r theta phi]
```

Note that this notation extends the usual polar coordinates notation,
with theta remaining the angle in the xy-plane and phi becoming the angle out of that plane.

```
>>> [1 1 0].toSphericalCoordinates
[2.sqrt, 0.25.pi, 1.arcSin]

>>> [1 1].toPolarCoordinates
[2.sqrt, 0.25.pi]
```

Collects over lists:

```
>>> [1 0 1; -2 0 0; 0 1 -1].toSphericalCoordinates
[2.sqrt 0 0.25.pi; 2 1.pi 0.5.pi; 2.sqrt 0.5.pi 0.75.pi]
```

* * *

See also: arcTan, fromSphericalCoordinates, norm, toPolarCoordinates, SphericalCoordinates

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ToSphericalCoordinates.html)

Categories: Converting, Geometry
