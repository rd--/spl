# gosperCurve

- _gosperCurve(anInteger)_

Answer the line segments representing the _anInteger_-th step Gosper curve.

The 1st step of the Gosper curve:

```
>>> 1.gosperCurve
[
	0 0;
	1 0;
	1.5 -0.866;
	0.5 -0.866;
	0 -1.732;
	1 -1.732;
	2 -1.732;
	2.5 -0.866
]
```

Lengths of successive iterations of the Gosper curve:

```
>>> 1:4.collect { :n |
>>> 	n.gosperCurve.size
>>> }
[8 50 344 2402]
```

Drawing of the third step of the Gosper curve:

~~~spl svg=A
3.gosperCurve.asLineDrawing
~~~

![](sw/spl/Help/Image/gosperCurve-A.svg)

The curve enumerates the tiles of a hexagonal grid:

~~~spl svg=B
2.gosperCurve.collect { :c |
	6.regularPolygon(c, 0.5, 0.5.pi)
}.LineDrawing
~~~

![](sw/spl/Help/Image/gosperCurve-B.svg)

* * *

See also: angleVector, hilbertCurve, peanoCurve, substitutionSystem

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Peano-GosperCurve.html),
_W_
[1](https://en.wikipedia.org/wiki/Gosper_curve)
