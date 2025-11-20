# fixedPoint

- _fixedPoint(f:/1, x, =)_

Starting with the value _x_,
apply the block _f_ repeatedly until the answer no longer changes,
according to _=_.

Show convergence to `2.sqrt` in Newton’s method:

```
>>> { :x |
>>> 	(x + (2 / x)) / 2
>>> }.fixedPoint(1, ~)
1.41421

>>> 2.sqrt
1.41421
```

Fixed point of an integer-valued function:

```
>>> { :x |
>>> 	1 + (x / 2).floor
>>> }.fixedPoint(1000, =)
2
```

Fixed point of a complex iteration:

```
>>> log:/1.fixedPoint(1J1, =)
0.318132J1.33724
```

Convergence may fail due to oscillations in the final digits.
Use a test function with a specific tolerance to resolve this:

```
>>> cos:/1.fixedPointList(0.5, ~).size
24

>>> cos:/1
>>> .fixedPointList(0.5) { :alpha :beta |
>>> 	(alpha - beta).abs < 0.1
>>> }
[0.5 0.8775 0.6390 0.8027 0.6948 0.7682]
```

* * *

See also: fixedPointList

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FixedPoint.html)
[2](https://reference.wolfram.com/language/ref/FixedPoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Fixed_point_(mathematics))
[2](https://en.wikipedia.org/wiki/Fixed-point_iteration)
