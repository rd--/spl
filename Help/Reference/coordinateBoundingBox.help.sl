# coordinateBoundingBox

- _coordinateBoundingBox(m)_

Answer the corners of the bounding box of the region defined by matrix _m_.

Find a bounding box for coordinates in two dimensions:

```
>>> [
>>> 	0 1;
>>> 	1 2;
>>> 	2 1;
>>> 	3 2;
>>> 	4 0
>>> ].coordinateBoundingBox
[
	0 0;
	4 2
]
```

The transposed `minMax` of the transposed matrix:

```
>>> [
>>> 	0 1;
>>> 	1 2;
>>> 	2 1;
>>> 	3 2;
>>> 	4 0
>>> ].transpose.collect(
>>> 	minMax:/1
>>> ).transpose
[
	0 0;
	4 2
]
```

`coordinateBoundingBox` is the transposed `coordinateBounds`.

```
>>> [0 1; 1 2; 2 1; 3 2; 4 0]
>>> .coordinateBounds
[0 4; 0 2]
```

Draw point set and bounding rectangle:

~~~spl svg=A
let p = [3 10; 6 3; 10 2; 2 8; 3 3];
[
	p.PointCloud,
	p.coordinateBoundingBox.asRectangle
].LineDrawing
~~~

![](sw/spl/Help/Image/coordinateBoundingBox-A.svg)

* * *

See also: coordinateBounds, minMax, transpose

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CoordinateBoundingBox.html),
[2](https://reference.wolfram.com/language/ref/BoundingRegion.html)

Categories: Array, Geometry
