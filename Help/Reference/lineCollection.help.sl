# lineCollection

- _lineCollection([v₁ v₂ …; …])_

Answer a `GeometryCollection` of `Line` values with vertices specified at _v_.

Calculate the arc length of a collection of lines:

```
>>> [0 0; 1 1:; 0 0; 1 0; 1 1]
>>> .lineCollection
>>> .arcLength
2.sqrt + 2
```

Complete graph with nine nodes:

~~~spl svg=A
(0 -- 2.pi)
.subdivide(9)
.allButLast
.collect { :t |
	[t.cos, t.sin]
}
.tuples(2)
.lineCollection
.asLineDrawing
~~~

![](sw/spl/Help/Image/lineCollection-A.svg)

A vector field:

~~~spl svg=B
{ :x :y |
	[
		[x, y],
		[x, y] + ([y, x] / 5) - 1
	]
}.table(0:10, 0:10)
.lineCollection
.asLineDrawing
~~~

![](sw/spl/Help/Image/lineCollection-B.svg)

A random collection of lines in two-dimensions:

~~~spl svg=C
Sfc32(3627814)
.randomReal([0 1], [100 2 2])
.lineCollection
.asLineDrawing
~~~

![](sw/spl/Help/Image/lineCollection-C.svg)

* * *

See also: GeometryCollection, Line, polygonCollection

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Line.html)
