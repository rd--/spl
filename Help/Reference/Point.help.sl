# Point

- _Point([x y …])_

A `Type` representing a geometric point in _n_-dimensions.

A two-dimensional cartesian co-ordinate has a `dimension` of `zero`,
and an `embeddingDimension` of two, which is also its `size`:

```
>>> let p = Point([1 2]);
>>> (
>>> 	p.dimension,
>>> 	p.embeddingDimension,
>>> 	p.size
>>> )
(0, 2, 2)
```

A three-dimensional cartesian co-ordinate:

```
>>> let p = Point([1 2 3]);
>>> (p.dimension, p.embeddingDimension)
(0, 3)
```

A `Point` can be drawn using `LineDrawing`,
draw a point and a unit circle at the origin:

~~~spl svg=A
[
	Point([0 0]),
	Circle([0 0], 1)
].LineDrawing
~~~

![](sw/spl/Help/Image/Point-A.svg)

Threads over lists:

~~~spl svg=B
(0, 0.1 .. 2.pi).collect { :x |
	[x x.sin]
}.Point.LineDrawing
~~~

![](sw/spl/Help/Image/Point-B.svg)

Use as a simple way to visualize volumes:

~~~spl svg=C
let p = [];
(-2, -1.8 .. 2).tuples(3).do { :each |
	(
		each.squared.sum.betweenAnd(1, 2) & {
			each.product >= 0
		}
	).ifTrue {
		p.add(each.Point)
	}
};
p.PerspectiveDrawing
~~~

![](sw/spl/Help/Image/Point-C.svg)

* * *

See also: asPoint, Circle, dimension, embeddingDimension, LineDrawing, PointCloud

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Point.html)
[2](https://reference.wolfram.com/language/ref/Point.html)

Categoriess: Geometry
