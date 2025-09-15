# isIsosceles

- _isIsosceles(t)_

Answer `true` if the triangle _t_ is isosceles,
that is if at least two sides are of equal length.

An isosceles triangle:

```
>>> sssTriangle(3, 3, 5)
>>> .isIsosceles
true
```

A scalene triangle:

```
>>> sssTriangle(3, 4, 5)
>>> .isIsosceles
false
```

An equilateral triangle is considered isosceles:

```
>>> sssTriangle(1, 1, 1)
>>> .isIsosceles
true
```

* * *

See also: isAcute, isHeronian, isObtuse, isScalene, isRight, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/IsoscelesTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Isosceles_triangle)
