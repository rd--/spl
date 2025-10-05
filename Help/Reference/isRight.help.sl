# isRight

- _isRight(x)_

Answer `true` if the object _x_ is right,

At `Quantity`:

```
>>> 90.degrees.isRight
true

>>> [60 180 270].degrees
>>> .collect(isRight:/1)
[false false false]
```

At `Triangle`,
a right triangle,
where one angle is ½π radians,
or 90°:

```
>>> sssTriangle(3, 4, 5)
>>> .isRight
true
```

An equilateral triangle:

```
>>> sssTriangle(1, 1, 1)
>>> .isRight
false
```

* * *

See also: isAcute, isHeronian, isIsosceles, isObtuse, isScalene, Triangle

Guides: Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RightTriangle.html),
_W_
[1](https://en.wikipedia.org/wiki/Right_triangle)
