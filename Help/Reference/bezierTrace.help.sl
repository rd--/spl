# bezierTrace

- _bezierTrace(aList, anInteger)_

Utilise `bezierFunction` to evaluate the Bézier curve specified by _aList_ at _anInteger_ places that are,
approximately,
equally spaced along the curve.
The algorithm utilises `bezierDistanceTable` to derive the index sequence for the Bézier calculations.

Draw a `bezierTrace` as a `PointCloud`,
indicating the uniform distances along the curve between equidistant sampling points:

~~~spl svg=A
[0 0; 1 4; 2 -4; 3 0]
.bezierTrace(64)
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/bezierTrace-A.svg)

* * *

See also: bezierApproximation, BezierCurve, bezierDistanceTable, bezierFunction

Guides: Geometry Functions
