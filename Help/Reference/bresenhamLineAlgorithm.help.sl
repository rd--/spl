# bresenhamLineAlgorithm

- _bresenhamLineAlgorithm([x₁ y₁; x₂ y₂])_

Bresenham’s algorithm for drawing a line.

Quadrant one:

```
>>> [0 1; 6 4].bresenhamLineAlgorithm
[0 1; 1 2; 2 2; 3 3; 4 3; 5 4; 6 4]
```

Quadrant two:

```
>>> [0 1; -6 4].bresenhamLineAlgorithm
[0 1; -1 2; -2 2; -3 3; -4 3; -5 4; -6 4]
```

Quadrant three:

```
>>> [0 1; -6 -4].bresenhamLineAlgorithm
[0 1; -1 0; -2 -1; -3 -2; -4 -2; -5 -3; -6 -4]
```

Quadrant four:

```
>>> [0 1; 6 -4].bresenhamLineAlgorithm
[0 1; 1 0; 2 -1; 3 -2; 4 -2; 5 -3; 6 -4]
```

There is a connection to Bjorklund’s algorithm,
the least rotation of equivalent queries are equal:

```
>>> [0 0; 7 12].bresenhamLineAlgorithm
>>> .collect(first:/1)
>>> .differences
>>> .lexicographicallyLeastRotation
[0 1 0 1 0 1 1 0 1 0 1 1]

>>> 7.bjorklundsAlgorithm(12)
>>> .lexicographicallyLeastRotation
[0 1 0 1 0 1 1 0 1 0 1 1]
```

A step plot:

~~~spl svg=A
[1 1; 11 5]
.bresenhamLineAlgorithm
.stepPlot
~~~

![](sw/spl/Help/Image/bresenhamLineAlgorithm-A.svg)

A matrix plot:

~~~spl svg=B
let [x2, y2] = [33, 15];
let l = [
	1 1; x2 y2
].bresenhamLineAlgorithm;
{ :i :j |
	l.includes([j, i]).boole
}.table(1:y2, 1:x2).matrixPlot
~~~

![](sw/spl/Help/Image/bresenhamLineAlgorithm-B.svg)

A bitmap drawing:

~~~spl png=C
let [x2, y2] = [111, 55];
let l = [
	1 1; x2 y2
].bresenhamLineAlgorithm;
{ :i :j |
	l.includes([j, i]).boole
}.table(1:y2, 1:x2).Bitmap
~~~

![](sw/spl/Help/Image/bresenhamLineAlgorithm-C.png)

* * *

See also: Line, LineSegment, xiaolinWuLineAlgorithm

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BresenhamsLineAlgorithm.html),
_W_
[1](https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm)

Further Reading: Bresenham 1965

Categories: Geometry
