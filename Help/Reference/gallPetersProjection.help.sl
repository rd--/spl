# gallPetersProjection

- _gallPetersProjection([ϕ λ])_

Answer the Gall-Peters projection of the geodetic coordinates _(ϕ, λ)_,
given in radians.

~~~spl svg=A
{ :phi :lambda |
	[phi lambda].gallPetersProjection
}.table(
	(-1/2.pi -- 1/2.pi).subdivide(10),
	(-1.pi -- 1.pi).subdivide(15)
).catenate.PointCloud.asLineDrawing
~~~

![](sw/spl/Help/Image/gallPetersProjection-A.svg)

* * *

See also: gallStereographicProjection
