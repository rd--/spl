# isScalene

- _isScalene(t)_

Answer `true` if the triangle _t_ is scalene,
that is if at no two sides are of equal length.

A scalene triangle:

```
>>> sssTriangle(3, 4, 5)
>>> .isScalene
true
```

An isosceles triangle:

```
>>> sssTriangle(3, 3, 5)
>>> .isScalene
false
```

An equilateral triangle:

```
>>> sssTriangle(1, 1, 1)
>>> .isScalene
true
```

* * *

See also: isAcute, isHeronian, isIsosceles, isObtuse, isRight, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScaleneTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Scalene_triangle)
