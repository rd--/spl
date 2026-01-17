# triangularSpiralPoints

- _triangularSpiralPoints(n)_

Answer a list of _(x,y)_ coordinate pairs of a triangular spiral with _n_ sides starting with the origin _(0,0)_.

The number of points in the first n sides:

```
>>> 0:10.collect { :n |
>>> 	n.triangularSpiralPoints.size
>>> }
[1 2 4 7 11 16 22 29 37 46 56]

>>> 0:10.collect { :n |
>>> 	1 + ((0.5 * n) * (n + 1))
>>> }
[1 2 4 7 11 16 22 29 37 46 56]
```

Plot first seven turns of the spiral:

~~~spl svg=A
(7 * 3).triangularSpiralPoints
.PointCloud
~~~

![](sw/spl/Help/Image/triangularSpiralPoints-A.svg)

Plot the points at prime indices on the first seventeen turns of the spiral:

~~~spl svg=B
let h = (17 * 3).triangularSpiralPoints;
let k = h.size;
let p = k.primesUpTo;
h.atAll(p).PointCloud
~~~

![](sw/spl/Help/Image/triangularSpiralPoints-B.svg)

The same diagram for lucky numbers:

~~~spl svg=C
let h = (17 * 3).triangularSpiralPoints;
let k = h.size;
let p = k.luckyNumbers;
h.atAll(p).PointCloud
~~~

![](sw/spl/Help/Image/triangularSpiralPoints-C.svg)

* * *

See also: anglePath, circlePoints, hexagonalSpiralPoints, squareSpiralPoints

Guides: Geometry Functions
