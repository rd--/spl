# Arc

- _Arc([x y], [r₁ r₂], [θ₁ θ₂])_

A `Type` that represents an arc between angles _θ_ of an ellipse of radii _r_ at center _(x,y)_.

```
>>> let a = Arc([0 0], [1 1], [1/2.pi 1.pi]);
>>> (
>>> 	a.center,
>>> 	a.radii,
>>> 	a.angles,
>>> 	a.arcLength,
>>> 	a.centralAngle,
>>> 	a.radius,
>>> 	a.apothem,
>>> 	a.sagitta,
>>> 	a.sectorArea,
>>> 	a.segmentArea
>>> )
(
	[0 0],
	[1 1],
	[1/2.pi 1.pi],
	1/2.pi,
	1/2.pi,
	1,
	2.sqrt / 2,
	1 - (2.sqrt / 2),
	1/4.pi,
	0.2854
)
```

Quarter-circle:

```
>>> let a = Arc([0 0], [1 1], [0 1/2.pi]);
>>> (a.sectorArea, a.centroid)
(1/4.pi, [4 / 3.pi, 4 / 3.pi])
```

Semi-circle:

```
>>> let a = Arc([0 0], [1 1], [0 1.pi]);
>>> (a.sectorArea, a.centroid)
(1/2.pi, [0, 4 / 3.pi])
```

Two circular arcs, and a line:

~~~spl svg=A
[
	Line([0 0; 2 0]),
	Arc([0 0], [1 1], [1.75.pi 0.5.pi]),
	Arc([2 0], [1 1], [0.75.pi 1.5.pi])
].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-A.svg)

An elliptical arc, and a circle:

~~~spl svg=B
let a = Arc([0 0], [1 2], [1.75.pi 0.75.pi]);
let c = Circle([0 0], 1);
[a c].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-B.svg)

A geometric technique for finding twelve equally-spaced points around a circle:

~~~spl svg=C
let r = 1 / 1/4.pi.cos;
let c = circlePoints(12, [0 0], 1, 0);
[
	Circle([0 0], 1),
	regularPolygon(4, [0 0], r, 1/4.pi),
	Arc([-1 0], [1 1], [-1/2.pi 1/2.pi]),
	Arc([1 0], [1 1], [1/2.pi -1/2.pi]),
	Arc([0 1], [1 1], [-1.pi 0]),
	Arc([0 -1], [1 1], [0 1.pi]),
	PointCloud(c)
].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-C.svg)

13th-century fifth-point arch shape,
according to Branner’s 1960 interpretation of the 13th-century Picard artist Villard de Honnecourt:

~~~spl svg=D
let n = 2 * 6.sqrt;
[
	Arc([5 0], [5 5], [1/2.pi 1.pi]),
	Arc([3 0], [5 5], [0 1/2.pi]),
	Line([4 0; 4 n])
].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-D.svg)

A Reuleaux triangle:

~~~spl svg=E
let t = sssTriangle(1, 1, 1);
{ :c :a |
	Arc(c, [1, 1], [a, a + 1/3.pi])
}.map(
	t.vertexCoordinates,
	[0, 2/3, 4/3].pi
).LineDrawing
~~~

![](sw/spl/Help/Image/Arc-E.svg)

Draw arcs between points on Farey sequences:

~~~spl svg=F
[2 .. 9].collect { :n |
	n.fareySequence
	.partition(2, 1)
	.collect { :each |
		let [a, b] = each.asFloat;
		let c = (b - a) / 2;
		Arc([a + c, 0], [c, c], [0, 1.pi])
	}
}.LineDrawing
~~~

![](sw/spl/Help/Image/Arc-F.svg)

Draw using parametric equation:

~~~spl svg=G
(0 -- 1).discretize(
	50,
	Arc([0 0], [1/2.pi 1], [5/8.pi 8/5.pi])
	.parametricEquation
).PointCloud
~~~

![](sw/spl/Help/Image/Arc-G.svg)

A long arc,
and an approximation,
drawn as a point cloud:

~~~spl svg=H
let a = Arc([0 0], [1 1], [5/4 3/4].pi);
let p = a.approximation.PointCloud;
[a p].LineDrawing
~~~

![](sw/spl/Help/Image/Arc-H.svg)

Draw a major sector:

~~~spl svg=I
Arc([0 0], [1 1], [5/4 3/4].pi)
.sector
~~~

![](sw/spl/Help/Image/Arc-I.svg)

Draw a minor sector:

~~~spl svg=J
Arc([0 0], [1 1], [2/5 3/5].pi)
.sector
~~~

![](sw/spl/Help/Image/Arc-J.svg)

Draw a proper segment:

~~~spl svg=K
Arc([0 0], [1 1], [-1/3 1/3].pi)
.segment
~~~

![](sw/spl/Help/Image/Arc-K.svg)

Draw a segment of a major sector,
by convention not properly a segment:

~~~spl svg=L
Arc([0 0], [1 1], [5/4 3/4].pi)
.segment
~~~

![](sw/spl/Help/Image/Arc-L.svg)

* * *

See also: Circle, CircularSector, CircularSegment, Ellipse, LineDrawing, Polygon, Rectangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Arc.html)
[2](https://mathworld.wolfram.com/Chord.html)
[3](https://mathworld.wolfram.com/Apothem.html)
[4](https://mathworld.wolfram.com/Sagitta.html)
[5](https://mathworld.wolfram.com/CircularSector.html)
[6](https://mathworld.wolfram.com/CentralAngle.html)
[7](https://reference.wolfram.com/language/ref/Circle.html),
_W_
[1](https://en.wikipedia.org/wiki/Circular_arc)
[2](https://en.wikipedia.org/wiki/Circular_sector)
[3](https://en.wikipedia.org/wiki/Central_angle)

Categories: Geometry
