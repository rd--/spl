# coordinateBoundsArray

- _coordinateBoundsArray(rangeList, stepList, offset=[0])_

Answer an array of coordinates,
with ranges in _rangeList_ and steps n _stepList_,
in each specified dimension.

A lattice of two-dimensional points:

```
>>> [3 8; -1 2]
>>> .coordinateBoundsArray([1 1])
[
	3 -1; 3 0; 3 1; 3 2;
	4 -1; 4 0; 4 1; 4 2;
	5 -1; 5 0; 5 1; 5 2;
	6 -1; 6 0; 6 1; 6 2;
	7 -1; 7 0; 7 1; 7 2;
	8 -1; 8 0; 8 1; 8 2
]
```

Draw a lattice of two-dimensional points:

~~~spl svg=A
[3 8; -1 2]
.coordinateBoundsArray([1 1])
.PointCloud
.asLineDrawing
~~~

![](sw/spl/Help/Image/coordinateBoundsArray-A.svg)

Draw an array of three-dimensionsal points with given discretization steps:

~~~spl svg=B
[3 6; -1 2; 0 1.pi]
.coordinateBoundsArray([0.7 1.5 0.5.pi])
.PointCloud
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/coordinateBoundsArray-B.svg)

Draw a lattice of two-dimensional points,
and a copy with points offset by _(0.5, 0.25)_:

~~~spl svg=C
let f = { :o |
	[3 8; -1 2]
	.coordinateBoundsArray(
		[1 1],
		o
	)
};
[
	f([0 0]).PointCloud,
	f([0.5 0.25]).PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/coordinateBoundsArray-C.svg)

* * *

See also: array, coordinateBounds, outer, Range, subdivide, table

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CoordinateBoundsArray.html),
