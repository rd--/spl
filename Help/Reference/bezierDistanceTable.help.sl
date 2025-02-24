# bezierDistanceTable

- _bezierDistanceTable(aList, anInteger)_

Answer two lists,
the first, _i_, is the equal division of the interval _(0, 1)_ into _anInteger_ parts,
the second, _d_, is the distance along the Bézier curve specified at _aList_ for each index in _i_.
The last item in _d_ is the arc length of the curve.

The distance between equally spaced indices is not, in general, equal:

~~~spl svg=A
let p = [35 140; 175 245; 15 35; 65 150];
let [i, d] = p.bezierDistanceTable(128);
[i, d / d.last].transposed.linePlot
~~~

![](sw/spl/Help/Image/bezierDistanceTable-A.svg)

* * *

See also: bezierApproximation, BezierCurve, bezierFunction, bezierTrace

Guides: Geometry Functions

Categories: Geometry
