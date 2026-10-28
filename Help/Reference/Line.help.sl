# Line

- _Line([p₁ p₂ …])_

A `Line` is a `Type` representing straight lines connecting a sequence of points _p_,
also called a polyline or polygonal chain.

Compute the `arcLength` of a line:

```
>>> Line[0 0; 1 1; 1 0; 2 0].arcLength
2.sqrt + 2
```

Compute the `midpoint` of a line in two dimensions:

```
>>> Line[0 0; 1 1; 1 0; 2 0].midpoint
[1, 2.sqrt / 2]
```

In three dimensions:

```
>>> Line[
>>> 	0 0 0;
>>> 	1 1 1;
>>> 	1 0 1;
>>> 	0 0 1
>>> ].midpoint
[1, 3.sqrt / 2, 1]
```

The `arcLength` of a `Line` in three-dimensions:

```
>>> Line[
>>> 	0 0 0;
>>> 	1 1 1;
>>> 	0 1 1;
>>> 	0 1 0
>>> ].arcLength
(3.sqrt + 2)
```

Threads over lists,
a line drawing of a complete graph with eleven vertices:

~~~spl svg=A
[0, 2.pi / 11 .. 2.pi].collect { :t |
	[t.cos, t.sin]
}.tuples(2).Line.LineDrawing
~~~

![](Help/Image/Line-A.svg)

A vector field:

~~~spl svg=B
{ :x :y |
	Line[
		[x, y],
		[x, y] + ([y, x] / 5) - 1
	]
}.table(0:10, 0:10).LineDrawing
~~~

![](Help/Image/Line-B.svg)

A random walk on a regular lattice:

~~~spl svg=C
let r = Sfc32(678215);
let m = [-1 0; 1 0; 0 1; 0 -1];
let p = m.randomChoice(r, [1000]).accumulate;
p.Line.nest.LineDrawing
~~~

![](Help/Image/Line-C.svg)

Moiré pattern:

~~~spl svg=D
[0, 0.02 .. 1].collect { :x |
	[
		[[x, 0], [1 - x, 1]],
		[[0, x], [1, 1 - x]]
	]
}.Line.LineDrawing
~~~

![](Help/Image/Line-D.svg)

A horizontal line along the _x_ axis,
the drawing specifies a minimal bounding box of _[0 0; 1 1]_:

~~~spl svg=E
[
	Line[0 0; 1 0]
].LineDrawing
~~~

![](Help/Image/Line-E.svg)

Draw a line in three dimensions:

~~~spl svg=F
Line[
	0 0 0;
	0 0 1;
	0 1 1;
	1 1 1
].PerspectiveDrawing
~~~

![](Help/Image/Line-F.svg)

Plot line and points given by derived polynomial:

~~~spl svg=G
let a = Line[-3 -2; 3 4];
let b = InfiniteLine[-3 -2; 3 4];
let c = b.polynomial;
[
	a,
	(-5 -- 5).discretize(
		9,
		{ :x |
			[x, c.at(x)]
		}
	).PointCloud
].LineDrawing
~~~

![](Help/Image/Line-G.svg)

Draw circle tangent lines:

~~~spl svg=H
[0, 6 .. 354].collect { :n |
	let theta = n.degree;
	let u = [theta.cos, theta.sin];
	let v = [theta.sin.-, theta.cos];
	Line[u, u + (v * 2)]
}.LineDrawing
~~~

![](Help/Image/Line-H.svg)

* * *

See also: HalfLine, InfiniteLine, Point, lineCollection

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Line.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygonal_chain)

Categories: Geometry
