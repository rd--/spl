# slopeInterceptForm

- _slopeInterceptForm(l)_
- _slopeInterceptForm([x₁ y₁], [x₂ y₂])_

Answer the slope-intercept form of a line, _y=mx+c_.

At `List`:

```
>>> [1 1].slopeInterceptForm([3 5])
[2 -1]

>>> (2 * 3) + -1
5
```

At `InfiniteLine`:

```
>>> InfiniteLine([-5 7; 1 3])
>>> .slopeInterceptForm
[-2/3 11/3]

>>> (-2/3 * 1) + 11/3
3
```

The _x_ and _y_ axes and parallels:

```
>>> [0 0].slopeInterceptForm([1 0])
[0 0]

>>> [0 1].slopeInterceptForm([1 1])
[0 1]

>>> let [m, c] = [0 0].slopeInterceptForm([0 1]);
>>> (m, c.isNaN)
(Infinity, true)

>>> [1 0].slopeInterceptForm([1 1])
[Infinity, -Infinity]
```

* * *

See also: HalfLine, InfiniteLine, Line, lineEquation

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Slope-InterceptForm.html)
[2](https://mathworld.wolfram.com/Slope.html)
[3](https://mathworld.wolfram.com/y-Intercept.html),
_W_
[1](https://en.wikipedia.org/wiki/Slope%E2%80%93intercept_form)
