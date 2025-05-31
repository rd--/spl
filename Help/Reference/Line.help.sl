# Line

- _Line([p₁ p₂ …])_
- _Line(start, end, dur)_

A `Line` is a `Type` representing straight lines connecting a sequence of points _p_,
also called a polyline or polygonal chain.

Compute the `arcLength` of a line:

```
>>> [0 0; 1 1; 1 0; 2 0].Line.arcLength
2.sqrt + 2
```

Compute the `midpoint` of a line in two dimensions:

```
>>> [0 0; 1 1; 1 0; 2 0].Line.midpoint
[1, 2.sqrt / 2]
```

In three dimensions:

```
>>> [
>>> 	0 0 0;
>>> 	1 1 1;
>>> 	1 0 1;
>>> 	0 0 1
>>> ].Line.midpoint
[1, 3.sqrt / 2, 1]
```

The `arcLength` of a `Line` in three-dimensions:

```
>>> [
>>> 	0 0 0;
>>> 	1 1 1;
>>> 	0 1 1;
>>> 	0 1 0
>>> ].Line.arcLength
(3.sqrt + 2)
```

The Svg description of a line segment:

```
>>> Line([0 0; 1 1]).forSvg(precision: 0)
'<line x1="0" y1="0" x2="1" y2="1" />'
```

The Svg description of a polyline:

```
>>> Line([0 0; 1 1; 1 0]).forSvg(precision: 0)
'<polyline points="0,0 1,1 1,0" />'
```

Threads over lists,
a line drawing of a complete graph with eleven vertices:

~~~spl svg=A
[0, 2.pi / 11 .. 2.pi].collect { :t |
	[t.cos, t.sin]
}.tuples(2).Line.LineDrawing
~~~

![](sw/spl/Help/Image/Line-A.svg)

A vector field:

~~~spl svg=B
{ :x :y |
	[
		[x, y],
		[x, y] + ([y, x] / 5) - 1
	].Line
}.table(0:10, 0:10).LineDrawing
~~~

![](sw/spl/Help/Image/Line-B.svg)

A random walk on a regular lattice:

~~~spl svg=C
let r = Sfc32(678215);
let m = [-1 0; 1 0; 0 1; 0 -1];
let p = m.randomChoice(r, [1000]).accumulate;
p.Line.nest.LineDrawing
~~~

![](sw/spl/Help/Image/Line-C.svg)

Moiré pattern:

~~~spl svg=D
(0, 0.02 .. 1).collect { :x |
	[
		[[x, 0], [1 - x, 1]],
		[[0, x], [1, 1 - x]]
	]
}.Line.LineDrawing
~~~

![](sw/spl/Help/Image/Line-D.svg)

A horizontal line along the _x_ axis,
the drawing specifies a minimal bounding box of _[0 0; 1 1]_:

~~~spl svg=E
[[0 0; 1 0].Line].LineDrawing
~~~

![](sw/spl/Help/Image/Line-E.svg)

Draw a line in three dimensions:

~~~spl svg=F
[
	0 0 0;
	0 0 1;
	0 1 1;
	1 1 1
].Line.asPerspectiveDrawing
~~~

![](sw/spl/Help/Image/Line-F.svg)

The ternary form of `Line` is a unit generator.
`Line` generates a line from the start value to the end value.

- start: starting value
- end: ending value
- dur: duration in seconds

Sweep oscillator frequency:

```
SinOsc(Line(200, 17000, 10), 0) * 0.1
```

Diverging frequencies:

```
SinOsc(
	Line(
		[900 1100],
		[200 1300],
		[9 17]
	),
	0
) * 0.1
```

`XLine` is usually better than `Line` for frequency:

```
SinOsc(XLine(200, 17000, 10), 0) * 0.1
```

_Note_: This is the Sc _Line_ Ugen without the _doneAction_ input.

* * *

See also: HalfLine, InfiniteLine, lineCollection, Point, XLine

References:
_Csound_
[1](https://csound.com/docs/manual/line.html),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Line.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/Line.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygonal_chain)

Categories: Geometry, Ugen
