# isAcute

- _isAcute(x)_

A predicate to decide if the object _x_ is acute.

At `Quantity`:

```
>>> 35.degrees.isAcute
true

>>> [90 120 270].degrees
>>> .collect(isAcute:/1)
[false false false]
```

At `Triangle`,
an equilateral triangle is acute:

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
