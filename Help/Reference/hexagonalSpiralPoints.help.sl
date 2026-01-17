# hexagonalSpiralPoints

- _hexagonalSpiralPoints(n)_

Answer a list of _(x,y)_ coordinate pairs of a hexagonal spiral with _n_ sides starting with the origin _(0,0)_.

Points on the first four sides of the spiral:

```
>>> 4.hexagonalSpiralPoints
[
	[ 0, 0],
	[ 1, 3.sqrt] / 2,
	[ 0, 3.sqrt],
	[-1, 3.sqrt],
	[-3, 3.sqrt] / 2
]
```

The number of points in the first n sides:

```
>>> 0:20.collect { :n |
>>> 	n.hexagonalSpiralPoints.size
>>> }
[
	 1  2  3  4  5  7  8 10 12 14
	16 19 21 24 27 30 33 37 40 44
	48
]

>>> 1:21.collect { :n |
>>> 	round((n + 3) ^ 2 / 12)
>>> }
[
	 1  2  3  4  5  7  8 10 12 14
	16 19 21 24 27 30 33 37 40 44
	48
]
```

Plot first nine turns of the spiral:

~~~spl svg=A
(9 * 6).hexagonalSpiralPoints
.PointCloud
~~~

![](sw/spl/Help/Image/hexagonalSpiralPoints-A.svg)

Plot the points at prime indices on the first twenty-three turns of the spiral:

~~~spl svg=B
let h = (23 * 6).hexagonalSpiralPoints;
let k = h.size;
let p = k.primesUpTo;
h.atAll(p).PointCloud
~~~

![](sw/spl/Help/Image/hexagonalSpiralPoints-B.svg)

The same diagram for lucky numbers:

~~~spl svg=C
let h = (23 * 6).hexagonalSpiralPoints;
let k = h.size;
let p = k.luckyNumbers;
h.atAll(p).PointCloud
~~~

![](sw/spl/Help/Image/hexagonalSpiralPoints-C.svg)

* * *

See also: anglePath, circlePoints, squareSpiralPoints, triangularSpiralPoints

Guides: Geometry Functions
