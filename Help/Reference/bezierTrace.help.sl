# bezierTrace

- _bezierTrace(c, n)_

Utilise `bezierFunction` to evaluate the Bézier curve specified by the list _c_ at _n_ places that are,
approximately,
equally spaced along the curve.
The algorithm utilises `bezierDistanceTable` to derive the index sequence for the Bézier calculations.

Draw a `bezierTrace` as a `PointSet`,
indicating the uniform distances along the curve between equidistant sampling points:

~~~spl svg=A
[0 0; 1 4; 2 -4; 3 0]
.bezierTrace(64)
.PointSet
~~~

![](Help/Image/bezierTrace-A.svg)

* * *

See also: BezierCurve, bezierApproximation, bezierDistanceTable, bezierFunction

Guides: Geometry Functions
