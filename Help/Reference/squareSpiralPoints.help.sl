# squareSpiralPoints

- _squareSpiralPoints(n)_

Answer a list of _(x,y)_ coordinate pairs of a square spiral with _n_ sides starting with the origin _(0,0)_.

Points on the first four sides of the spiral:

```
>>> 3.squareSpiralPoints
[0 0; 0 1; -1 1; -1 0; -1 -1; 0 -1; 1 -1]
```

The number of points in the first n sides:

```
>>> 0:10.collect { :n |
>>> 	n.squareSpiralPoints.size
>>> }
[1 2 3 5 7 10 13 17 21 26 31]

>>> 0:10.collect { :n |
>>> 	((n + 1) ^ 2 / 4).floor + 1
>>> }
[1 2 3 5 7 10 13 17 21 26 31]
```

Plot first nine turns of the spiral:

~~~spl svg=A
(9 * 4).squareSpiralPoints
.PointCloud
~~~

![](sw/spl/Help/Image/squareSpiralPoints-A.svg)

Plot the points at prime indices on the first twenty-three turns of the spiral:

~~~spl svg=B
let h = (23 * 4).squareSpiralPoints;
let k = h.size;
let p = k.primesUpTo;
h.atAll(p).PointCloud
~~~

![](sw/spl/Help/Image/squareSpiralPoints-B.svg)

The same diagram for lucky numbers:

~~~spl svg=C
let h = (23 * 4).squareSpiralPoints;
let k = h.size;
let p = k.luckyNumbers;
h.atAll(p).PointCloud
~~~

![](sw/spl/Help/Image/squareSpiralPoints-C.svg)

* * *

See also: anglePath, circlePoints, hexagonalSpiralPoints, triangularSpiralPoints

Guides: Geometry Functions
