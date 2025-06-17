# mercatorProjection

- _mercatorProjection([ϕ λ])_

Answer the Mercator projection of the geodetic coordinates _(ϕ, λ)_,
given in radians.
The answer are Cartesian coordinates of the form  _(x,y)_,
where _x_ is in _(-π,π)_ and _y_ is in _~(-π,π)_ while ϕ is in _~(-85,85)°_.

~~~spl svg=A
{ :phi :lambda |
	[phi lambda].mercatorProjection
}.table(
	(-85 -- 85).degree.subdivide(8),
	(-90 -- 90).degree.subdivide(16)
).catenate.PointCloud
~~~

![](sw/spl/Help/Image/mercatorProjection-A.svg)

* * *

See also: gallPetersProjection, gallStereographicProjection, GeodeticCoordinates, namedCartographicProjection

Guides: Geodetic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/MercatorProjection.html),
_Proj_
[1](https://proj.org/en/stable/operations/projections/merc.html),
_W_
[1](https://en.wikipedia.org/wiki/Mercator_projection)
