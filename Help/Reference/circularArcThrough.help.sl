# circularArcThrough

- _circularArcThrough([p₁ p₂ p₃])_

Answer the circular `Arc` passing through the specified points.

A circular arc passing through three points:

```
>>> [2.sqrt 0; 1 1; 0 2.sqrt]
>>> .circularArcThrough
Arc(
	[0 0],
	[2.sqrt 2.sqrt],
	[0 1/2.pi]
)
```

The arc begins at the first point, passes through the second point, and ends at the third point:

```
>>> let a = 1 / 2.sqrt;
>>> let b = a / 2;
>>> let c = (1/8 + (1 - b).square).sqrt;
>>> let d = 1 / (2 * 2.sqrt * (1 - b));
>>> let e = d.arcTan;
>>> let f = 2.pi - e;
>>> [1 a; 0 1; 1 0]
>>> .circularArcThrough
Arc([b b], [c c], [e f])
```

The arc length of an arc passing through a set of points:

```
>>> [1/2 3/4.sqrt; -1/2 3/4.sqrt; -1 0]
>>> .circularArcThrough
>>> .arcLength
2/3.pi
```

Plot a minor circular arc passing through three points:

~~~spl svg=A
let p = [2.sqrt 0; 1 1; 0 2.sqrt];
let a = p.circularArcThrough;
[
	a,
	p.PointCloud,
	a.center.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/circularArcThrough-A.svg)

Plot a major circular arc passing through three points:

~~~spl svg=B
let y = 1 / 2.sqrt;
let p = [0 1; 1 0; 1 y];
let a = p.circularArcThrough;
[
	p.PointCloud,
	a.center.Point,
	[1/2 1/2].unitSquare,
	a
].LineDrawing
~~~

![](sw/spl/Help/Image/circularArcThrough-B.svg)

Plot a minor circular arc passing through three points:

~~~spl svg=C
let y = 1 / 2.sqrt;
let p = [1 0; 1 y; 0 1];
let a = p.circularArcThrough;
[
	p.PointCloud,
	a.center.Point,
	[1/2 1/2].unitSquare,
	a
].LineDrawing
~~~

![](sw/spl/Help/Image/circularArcThrough-C.svg)

Plot a major circular arc passing through three points:

~~~spl svg=D
let y = 1 / 2.sqrt;
let p = [1 y; 0 1; 1 0];
let a = p.circularArcThrough;
[
	p.PointCloud,
	a.center.Point,
	[1/2 1/2].unitSquare,
	a
].LineDrawing
~~~

![](sw/spl/Help/Image/circularArcThrough-D.svg)

Draw a minor arc, ascending from _(0,0)_ to _(1,1)_:

~~~spl svg=E
let x = 1 / 2.sqrt;
let p = [0 0; x 0.5; 1 1];
let a = p.circularArcThrough;
[
	p.PointCloud,
	a.center.Point,
	[1/2 1/2].unitSquare,
	a
].LineDrawing
~~~

![](sw/spl/Help/Image/circularArcThrough-E.svg)

Draw a minor arc, ascending from _(0,0)_ to _(1,1)_:

~~~spl svg=F
let y = 1 / 2.sqrt;
let p = [0 0; 0.5 y; 1 1];
let a = p.circularArcThrough;
[
	p.PointCloud,
	a.center.Point,
	[1/2 1/2].unitSquare,
	a
].LineDrawing
~~~

![](sw/spl/Help/Image/circularArcThrough-F.svg)

* * *

See also: Arc, Circle, circleThrough

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CircularArcThrough.html)
