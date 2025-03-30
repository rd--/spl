# polygonCentroid

- _polygonCentroid(aMatrix)_

Answer the centroid of the polygon _aMatrix_.

Draw the convex hull,
_h_,
of a set of thirteen random coordinates,
_p_,
and the centroid of the hull:

~~~spl svg=A
let r = Sfc32(178432);
let p = r.randomReal([-1 1], [13 2]);
let h = p.convexHull;
[
	h.Polygon,
	h.polygonCentroid.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/polygonCentroid-A.svg)

* * *

See also: centroid, Polygon, shoelaceFormula
