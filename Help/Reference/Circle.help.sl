# Circle

- _Circle([x y …], r)_

A `Type` that represents a circle of radius _r_ at center coordinates _x,y_.

```
>>> let c = Circle([0 0], 1);
>>> (c.isCircle, c.center, c.radius)
(true, [0 0], 1)
```

Implements `x` and `y` to access components of `center`:

```
>>> let c = Circle([0 0], 1);
>>> (c.x, c.y)
(0, 0)
```

Calculate `arcLength`, `area`, `circumference`, `perimeter`, `centroid`, `diameter` and `radius`:

```
>>> let c = Circle([0 0], 1);
>>> (
>>> 	c.arcLength,
>>> 	c.area,
>>> 	c.circumference,
>>> 	c.perimeter,
>>> 	c.centroid,
>>> 	c.center,
>>> 	c.diameter,
>>> 	c.radius,
>>> 	c.curvature
>>> )
(2.pi, 1.pi, 2.pi, 2.pi, [0 0], [0 0], 2, 1, 1)
```

Circles can be elements of `LineDrawing`s.
Specify radii:

~~~spl svg=A
Circle([0 0; 0 0; 0 0], [1 3 5])
.LineDrawing
~~~

![](sw/spl/Help/Image/Circle-A.svg)

Specify centers:

~~~spl svg=B
Circle([0 0; 1 1; 2 2], 1).LineDrawing
~~~

![](sw/spl/Help/Image/Circle-B.svg)

The _Seed of Life_:

~~~spl svg=C
[
	Circle([0 0], 1),
	{ :i |
		let x = (2.pi * i / 6);
		Circle([x.cos x.sin], 1)
	}.table(1:6)
].LineDrawing
~~~

![](sw/spl/Help/Image/Circle-C.svg)

The square packing of circles:

~~~spl svg=D
{ :i :j |
	Circle([i j], 0.5)
}.table(1:7, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/Circle-D.svg)

The hexagonal packing of circles:

~~~spl svg=E
{ :i :j |
	Circle(
		[
			i + ((-1 ^ j + 1) / 4),
			3.sqrt / 2 * j
		],
		0.5
	)
}.table(1:7, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/Circle-E.svg)

Compare the hexagonal packing of circles above to a simple half-width offset schema:

~~~spl svg=F
{ :i :j |
	let x = i + ((-1 ^ j + 1) / 4);
	let y = j;
	Circle([x, y], 0.5)
}.table(1:7, 1:5).LineDrawing
~~~

![](sw/spl/Help/Image/Circle-F.svg)

A geometric technique for finding twelve equally-spaced points around a circle:

~~~spl svg=G
[
	Circle(
		[0 0; -1 0; 1 0; 0 -1; 0 1],
		1
	),
	regularPolygon(
		4,
		[0 0],
		1 / 1/4.pi.cos,
		1/4.pi
	),
	PointCloud(
		circlePoints(12, [0 0], 1, 0)
	)
].LineDrawing
~~~

![](sw/spl/Help/Image/Circle-G.svg)

Circle and square of equal area:

~~~spl svg=H
let n = 1.pi.sqrt / 2;
let m = 0 - n;
[
	Circle([0 0], 1),
	Rectangle([m m], [n n])
].LineDrawing
~~~

![](sw/spl/Help/Image/Circle-H.svg)

A hexafoil:

~~~spl svg=I
let c = [0 0];
let r = 1;
let h = 6.circlePoints(c, r, 0);
[
	Circle(c, r),
	h.collect { :u |
		Circle(u, 1)
	}
].LineDrawing
~~~

![](sw/spl/Help/Image/Circle-I.svg)

Draw circles from the Apollonian pencil of segment _ab_:

~~~spl svg=J
let a = [1 0];
let b = [0 0] - a;
[
	Circle([0 0], 1),
	[0.1, 0.2 .. 0.7].collect { :k |
		let kk = k.square;
		let c = (a - b).norm;
		let d = (kk / (1 - kk)) * c;
		let r = (k / (1 - kk)) * c;
		[
			Circle(a + [d, 0], r),
			Circle(b - [d, 0], r)
		]
	}
].LineDrawing
~~~

![](sw/spl/Help/Image/Circle-J.svg)

Draw Apollonian circles:

~~~spl svg=K
let alphaFamily = { :t |
	Circle(
		[t + (1 / t) / 2, 0],
		(t - (1 / t)).abs / 2
	)
};
let betaFamily = { :lambda |
	Circle(
		[0 lambda],
		(lambda.square + 1).sqrt
	)
};
let t = (0.2 -- 0.8).discretize(10);
let l = (0.25 -- 2.5).discretize(5);
[
	(t.- ++ t).collect(alphaFamily:/1),
	(l.- ++ l).collect(betaFamily:/1)
].LineDrawing
~~~

![](sw/spl/Help/Image/Circle-K.svg)

Plot using implicit equation:

~~~spl svg=L
let i = (-1 -- 1).subdivide(35);
Circle([0 0], 1)
.implicitEquation
.contourPlot(i, i, [0])
~~~

![](sw/spl/Help/Image/Circle-L.svg)

A family of circles:

~~~spl svg=M
1:20.collect { :t |
	let x = (2.pi * t / 20).cos;
	let y = (2.pi * t / 20).sin;
	let r = 1;
	Circle([x y], 1)
}.LineDrawing
~~~

![](sw/spl/Help/Image/Circle-M.svg)

* * *

See also: Arc, arcLength, area, centroid, circleThrough, Disk, Ellipse, GeneralisedCircle, LineDrawing, perimeter, Polygon, Rectangle, r, Triangle, unitCircle, x, y

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Circle.html)
[2](https://reference.wolfram.com/language/ref/Circle.html),
_W_
[1](https://en.wikipedia.org/wiki/Circle)

Categories: Geometry
