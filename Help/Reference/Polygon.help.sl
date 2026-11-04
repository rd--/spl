# Polygon

- _Polygon([v₁ v₂ …])_

A Polygon is a `Type` representing a polygon with vertex coordinates given by _v_.

The `area` and `centroid` of two triangles:

```
>>> let p = Polygon[1 0; 0 3.sqrt; -1 0];
>>> (p.area, p.centroid, p.boundingBox)
(3.sqrt, [0, 3.sqrt / 3], [-1 0; 1 3.sqrt])

>>> let p = Polygon[1 0; 1 1; 0 0];
>>> (p.area, p.centroid)
(1/2, [2/3 1/3])
```

The `area`, `centroid` and `interiorAngles` of a pentagon:

```
>>> let p = Polygon[1 6; 3 1; 7 2; 4 4; 8 5];
>>> (
>>> 	p.area,
>>> 	p.centroid,
>>> 	p.interiorAngles,
>>> 	p.boundingBox
>>> )
(
	33/2,
	[35/9 11/3],
	[1.0484 1.7063 0.8330 5.4502 0.3869],
	[1 1; 8 6]
)
```

At `Rectangle`:

```
>>> Rectangle([0 0], [1 1])
>>> .Polygon
Polygon([0 0; 1 0; 1 1; 0 1])
```

At `Triangle`:

```
>>> Triangle([0 0], [1 0], [0 1])
>>> .Polygon
Polygon([0 0; 1 0; 0 1])
```

Regular hexagonal tiling:

~~~spl svg=A
let h = { :x :y |
	{ :k |
		[
			(2.pi * k / 6).cos + x,
			(2.pi * k / 6).sin + y
		]
	}.table(1:6).Polygon
};
{ :i :j |
	h(
		3 * i + (3 * (-1 ^ j + 1) / 4),
		3.sqrt / 2 * j
	)
}.table(1:5, 1:10)
~~~

![](Help/Image/Polygon-A.svg)

Digital petals:

~~~spl svg=B
let d = 2.pi / 12;
{ :r :q |
	let dx = { :x |
		d * (q + x)
	};
	Polygon[
		(8 - r) * [-1.dx.cos, -1.dx.sin],
		(8 - r) * [1.dx.cos, 1.dx.sin],
		(10 - r) * [0.dx.cos, 0.dx.sin]
	]
}.table(1:6, 1:12)
~~~

![](Help/Image/Polygon-B.svg)

A dozen random triangles:

~~~spl svg=C
Sfc32(147982)
.randomReal([1 100], [12 3 2])
.Polygon
~~~

![](Help/Image/Polygon-C.svg)

The outline of a glyph:

~~~spl svg=D
Polygon[
	2 3;
	0.8125 0.625;
	0.9375 0.625;
	1.3125 1.375;
	2.4375 1.375;
	2.8125 0.625;
	3.1875 0.625
	:;
	1.875 2.5;
	1.375 1.5;
	2.375 1.5
]
~~~

![](Help/Image/Polygon-D.svg)

A regular triangle and regular hexagon with integer coordinates in ℝ³:

~~~spl svg=E
[
	Polygon[
		0 0 0; 4 1 1; 1 4 1
	],
	Polygon[
		0 0 0; 7 -2 1; 12 3 3;
		10 10 4; 3 12 3; -2 7 1
	],
	Cuboid[
		-2 -2 -2;
		12 12 12
	],
	PointSet(
		[-2 5 12].tuples(3)
	)
]
~~~

![](Help/Image/Polygon-E.svg)

Apart from the rectangle the octagon is the only equiangular lattice polygon:

~~~spl svg=F
[
	Polygon[
		1 0; 2 0; 3 1; 3 2;
		2 3; 1 3; 0 2; 0 1
	],
	PointSet(
		[0 .. 3].tuples(2)
	)
]
~~~

![](Help/Image/Polygon-F.svg)

The Minkowski version of the Chinese proof of the Pythagorean theorem,
the side lengths of _s_ are equal to _c_:

~~~spl svg=G
let a = 5;
let b = 1.25;
let c = (a.square + b.square).sqrt;
let d = a + b;
let p = Rectangle[0 0; d d];
let q = Rectangle[a 0; d b];
let r = Rectangle[0 a; b d];
let s = Polygon[0 0; a b; d d; b a];
[p q r s]
~~~

![](Help/Image/Polygon-G.svg)

* * *

See also: PolygonWithHoles, area, centroid, interiorAngles, polygonCollection, randomPolygon, regularPolygon, vertexCoordinates

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Polygon.html)
[2](https://reference.wolfram.com/language/ref/Polygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygon)
