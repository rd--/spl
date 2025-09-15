# isAcute

- _isAcute(t)_

A predicate to decide if the triangle _t_ is acute.

An equilateral triangle is acute:

```
>>> [1 1 1].sssTriangle.isAcute
true
```

An obtuse triangle:

```
>>> [12 6.5 9.5].sssTriangle.isAcute
false
```

A right triangle is not acute:

```
>>> [3 4 5].sssTriangle.isAcute
false
```

* * *

See also: interiorAngles, isObtuse, isRight, pi, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AcuteAngle.html)
[2](https://mathworld.wolfram.com/AcuteTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Acute_triangle)
