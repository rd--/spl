# gallStereographicProjection

- _gallStereographicProjection([ϕ λ])_

Answer the Gall stereographic projection of the geodetic coordinates _(ϕ, λ)_,
given in radians.
The answer are Cartesian coordinates of the form _(x,y)_,
where _x_ is in _±π/√2_ and _y_ is in _±1+√2/2_.

~~~spl svg=A
{ :phi :lambda |
	[phi lambda]
	.gallStereographicProjection
}.table(
	(-1/2.pi -- 1/2.pi).subdivide(8),
	(-1.pi -- 1.pi).subdivide(16)
).catenate.PointCloud.asLineDrawing
~~~

![](sw/spl/Help/Image/gallStereographicProjection-A.svg)

* * *

See also: gallPetersProjection, GeodeticCoordinates

Guides: Geodetic Functions

References:
_Mathworks_
[1](https://mathworks.com/help/map/gstereo.html),
_Proj_
[1](https://proj.org/en/stable/operations/projections/gall.html),
_W_
[1](https://en.wikipedia.org/wiki/Gall_stereographic_projection)

Further Reading: Snyder 1993
