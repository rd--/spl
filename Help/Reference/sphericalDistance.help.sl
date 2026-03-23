# sphericalDistance

- _sphericalDistance([θ₁ ϕ₁], [θ₂ ϕ₂])_

Answer the great-circle distance between the specified points on the surface of a unit sphere.
Note that θ is azimuth and φ inclination angle (polar angle, zenith angle, normal angle, colatitude).

```
>>> [0 1/4].pi.sphericalDistance(
>>> 	[1/4 1/3].pi
>>> )
((1 / (2 * 2.sqrt)) + (3.sqrt / 4)).arcCos

>>> [87 10].degree.sphericalDistance(
>>> 	[135.3 40].degree
>>> )
0.594089
```

Calculate an angular distance along the great circle _θ=π/2_:

```
>>> [1/5 1/2].pi.sphericalDistance(
>>> 	[1/2 1/2].pi
>>> )
3/10.pi
```

Calculate an angular distance along the great circle _ϕ=π_:

```
>>> [1 1/5].pi.sphericalDistance(
>>> 	[1 1/2].pi
>>> )
3/10.pi
```

Both results are the difference of component values:

```
>>> 1/2.pi - 1/5.pi
3/10.pi
```

Relation to `vectorAngle`:

```
>>> let a = [1.63980 2.753950];
>>> let b = [1.18725 0.270879];
>>> a.sphericalDistance(b)
2.49989

>>> let a = [1 1.63980 2.753950];
>>> let b = [1 1.18725 0.270879];
>>> let p = a.fromSphericalCoordinates;
>>> let q = b.fromSphericalCoordinates;
>>> p.vectorAngle(q, 'Unsigned')
2.49989
```

* * *

See also: arcCos, cos, haversine, inverseHaversine, sin, SphericalCoordinates, vectorAngle

Guides: Coordinate System Functions, Geometry Functions, Trigonometric Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/GreatCircle.html)
[2](https://reference.wolfram.com/language/ref/SphericalDistance.html),
_W_
[1](https://en.wikipedia.org/wiki/Great-circle_distance)
