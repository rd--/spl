# isObtuse

- _isObtuse(t)_

A predicate to decide if the triangle _t_ is obtuse.

An obtuse triangle:

```
>>> [12 6.5 9.5].sssTriangle.isObtuse
true
```

A right triangle is not obtuse:

```
>>> [3 4 5].sssTriangle.isObtuse
false
```

An equilateral triangle is not obtuse:

```
>>> [1 1 1].sssTriangle.isObtuse
false
```

* * *

See also: interiorAngles, isAcute, pi, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ObtuseAngle.html)
[2](https://mathworld.wolfram.com/ObtuseTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Obtuse_triangle)
