# signedPointPlaneDistance

- _signedPointPlaneDistance(aPlane, aPoint)_

Answer the signed distance from _aPoint_ to _aPlane_.
The plane is given as _ax + by + cz + d = 0_,
the point as _x y z_.
The sign is positive if _x_ is on the same side of the plane as the normal vector of the plane,
and negative if it is on the opposite side.

```
>>> [1 2 2 -2].signedPointPlaneDistance(
>>> 	[2 5 4]
>>> )
6

>>> [2 3 -1 -6]
>>> .signedPointPlaneDistance([0 0 0])
(-6 / 14.sqrt)

>>> [1 1 0 -2].signedPointPlaneDistance(
>>> 	[-1 1 2]
>>> )
2.sqrt.negated

>>> [3 4 -1 -1]
>>> .signedPointPlaneDistance([1 2 3])
(7 / 26.sqrt)

>>> [5 3 1 -8].signedPointPlaneDistance(
>>> 	[1 7 4]
>>> )
(22 / 35.sqrt)
```

* * *

See also: hessianNormalForm, pointPlaneDistance

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Point-PlaneDistance.html)

Categories: Geometry
