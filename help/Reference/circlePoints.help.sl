# circlePoints

- _circlePoints(n, r, theta)_
- _circlePoints(alpha, beta)_ ⟹ _circlePoints(alpha, beta, (2 * pi) / alpha))_

Answer the positions of _n_ points equally spaced around a circle of radius _r_ given initial angle _theta_.

Corners of an equilateral triangle:

```
>>> 3.circlePoints(1)
[
	[3.sqrt / 2, -1 / 2],
	[0, 1],
	[3.sqrt / -2, -1 / 2]
]
```

A square with side length two centered at _(0,0)_:

```
>>> 4.circlePoints(2.sqrt)
[1 -1; 1 1; -1 1; -1 -1]
```

Four unitary vectors aligned with the axes:

```
>>> 4.circlePoints(1, 0)
[1 0; 0 1; -1 0; 0 -1]
```

C.f. `angleVector`:

```
>>> 6.circlePoints(1, 0)
(0, pi / 3 .. 2 * pi).collect(angleVector:/1).allButLast
```

* * *

See also: %, ^, angleVector, Circle, cos, Range, sin

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CirclePoints.html)

Categories: Geometry
