# fixedPointList

- _fixedPointList(aBlock:/1, anObject, equalBlock:/2)_

Generates a `List` giving the results of applying _aBlock_ repeatedly,
starting with _anObject_,
until the results no longer change according to _equalBlock_.

Find the sequence of values leading to a fixed point:

```
>>> { :x |
>>> 	1 + (x / 2).floor
>>> }.fixedPointList(1000, =)
[1000 501 251 126 64 33 17 9 5 3 2 2]
```

Repeated application of a rule until the result no longer changes:

Show convergence to `2.sqrt` in Newton’s method:

```
>>> { :x |
>>> 	(x + (2 / x)) / 2
>>> }.fixedPointList(1, ~)
[1 1.5 1.41666 1.41422 1.41421]
```

Convergence may fail due to oscillations in the final digits.
Use a test function with a specific tolerance to resolve this:

```
>>> cos:/1.fixedPointList(0.5, ~).size
24

>>> cos:/1.fixedPointList(0.5) { :alpha :beta |
>>> 	(alpha - beta).abs < 0.1
>>> }
[0.5 0.8775 0.6390 0.8027 0.6948 0.7682]
```

* * *

See also: fixedPoint, nestList, nestWhileList

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FixedPoint.html)
[2](https://reference.wolfram.com/language/ref/FixedPointList.html)
