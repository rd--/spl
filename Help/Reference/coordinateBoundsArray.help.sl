# coordinateBoundsArray

- _coordinateBoundsArray(rangeList, stepList, offset=[0])_

Answer an array of coordinates,
with ranges in _rangeList_ and steps in _stepList_,
in each specified dimension.

A lattice of two-dimensional points:

```
>>> [3 8; -1 2]
>>> .coordinateBoundsArray([1 1], [0])
[
	3 -1; 3 0; 3 1; 3 2:;
	4 -1; 4 0; 4 1; 4 2:;
	5 -1; 5 0; 5 1; 5 2:;
	6 -1; 6 0; 6 1; 6 2:;
	7 -1; 7 0; 7 1; 7 2:;
	8 -1; 8 0; 8 1; 8 2
]
```

Answer an array of lists of coordinates, even in only one dimension:

```
>>> [[0, 10]].coordinateBoundsArray([2])
[0; 2; 4; 6; 8; 10]
```

Draw a lattice of two-dimensional points:

~~~spl svg=A
let b = [3 8; -1 2];
let c = b.coordinateBoundsArray([1 1]);
let p = c.flatten(1).PointCloud;
let r = b.transposed.asRectangle;
[p, r].LineDrawing
~~~

![](sw/spl/Help/Image/coordinateBoundsArray-A.svg)

Draw an array of three-dimensionsal points with given discretization steps:

~~~spl svg=B
[3 6; -1 2; 0 1.pi]
.coordinateBoundsArray([0.7 1.5 0.5.pi])
.flatten(2)
.PointCloud
.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/coordinateBoundsArray-B.svg)

Draw a lattice of two-dimensional points,
and a copy with points offset by _(0.5, 0.25)_,
which places some coordinates outside the specified bounds:

~~~spl svg=C
let b = [3 8; -1 2];
let f = { :o |
	b.coordinateBoundsArray(
		[1 1],
		o
	).flatten(1)
};
[
	f([0 0]).PointCloud,
	f([0.5 0.25]).PointCloud,
	b.transposed.asRectangle
].LineDrawing
~~~

![](sw/spl/Help/Image/coordinateBoundsArray-C.svg)

* * *

See also: array, coordinateBoundingBoxArray, coordinateBounds, coordinateBoundsList, outer, Range, subdivide, table

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CoordinateBoundsArray.html),
