# gallPetersProjection

- _gallPetersProjection([ϕ λ])_

Answer the Gall-Peters projection of the geodetic coordinates _(ϕ, λ)_,
given in radians.
The answer are Cartesian coordinates of the form  _(x,y)_,
where _x_ is in _(-π,π)_ and _y_ is in _(-2,2)_.

~~~spl svg=A
{ :phi :lambda |
	[phi lambda].gallPetersProjection
}.table(
	(-1/2.pi -- 1/2.pi).subdivide(8),
	(-1.pi -- 1.pi).subdivide(16)
).catenate.PointCloud
~~~

![](sw/spl/Help/Image/gallPetersProjection-A.svg)

* * *

See also: gallStereographicProjection, GeodeticCoordinates

Guides: Geodetic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PetersProjection.html),
_Proj_
[1](https://proj.org/en/stable/operations/projections/cea.html),
_W_
[1](https://en.wikipedia.org/wiki/Gall%E2%80%93Peters_projection)
