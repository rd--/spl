# lineEquation

- _lineEquation(l)_
- _lineEquation([x₁ y₁], [x₂ y₂])_

Answer the terms of the standard form linear equation for a line,
_ax+by+c=0_.

At `List`,
the line given by the two points _(1,1)_ and _(3,5)_ has implicit equation _2x-y-1=0_,
and slope-intercept form _y=2x-1_:

```
>>> [1 1].lineEquation([3 5])
[2 -1 -1]

>>> (
>>> 	4 - 2 - 2,
>>> 	12 - 10 - 2,
>>> 	-4 / -2,
>>> 	2 / -2
>>> )
(0, 0, 2, -1)
```

At `InfiniteLine`,
the line given by _(-5,7)_ and _(1,3)_ has implicit equation _-2x-3y-11=0_,
and slope-intercept form _y=-2x/3-11/3_:

```
>>> InfiniteLine([-5 7; 1 3])
>>> .lineEquation
[-2 -3 11]

>>> (
>>> 	10 - 21 + 11,
>>> 	-2 -9 + 11,
>>> 	2 / -3,
>>> 	-11 / -3
>>> )
(0, 0, -2/3, 11/3)
```

The _x_ and _y_ axes and parallels:

```
>>> [0 0].lineEquation([1 0])
[0 -1 0]

>>> [0 1].lineEquation([1 1])
[0 -1 1]

>>> [0 0].lineEquation([0 1])
[1 0 0]

>>> [1 0].lineEquation([1 1])
[1 0 -1]
```

If the coefficients are all integers they are given in reduced form:

```
>>> [0 0].lineEquation([1 1])
[1 -1 0]

>>> [-1 -1].lineEquation([2 2])
[1 -1 0]
```

* * *

See also: HalfLine, InfiniteLine, Line, slopeInterceptForm

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LinearEquation.html)
[2](https://mathworld.wolfram.com/StandardForm.html),
_W_
[1](https://en.wikipedia.org/wiki/Linear_equation)

Categories: Geometry
