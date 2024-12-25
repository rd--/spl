# lineEquation

- _lineEquation(aPoint, anotherPoint)_

Answer the terms of the linear equation for a line given by two points.

The line given by _(1,1)_ and _(3,5)_ has equation _4x - 2y - 2 = 0_,
and slope-intercept form _y = 2x - 1_:

```
>>> [1 1].lineEquation([3 5])
[4 -2 -2]

>>> (
>>> 	4 - 2 - 2,
>>> 	12 - 10 - 2,
>>> 	-4 / -2,
>>> 	2 / -2
>>> )
(0, 0, 2, -1)
```

The line given by _(-5,7)_ and _(1,3)_ has equation _-4x - 6y - 22 = 0_,
and slope-intercept form _y = -2/3x - 11/3_:

```
>>> [-5 7].lineEquation([1 3])
[-4 -6 22]

>>> (
>>> 	20 - 42 + 22,
>>> 	-4 -18 + 22,
>>> 	4 / -6,
>>> 	-22 / -6
>>> )
(0, 0, -2/3, 11/3)
```

* * *

See also: HalfLine, InfiniteLine, Line

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LinearEquation.html)
[2](https://mathworld.wolfram.com/StandardForm.html),
_W_
[1](https://en.wikipedia.org/wiki/Linear_equation)

Categories: Geometry
