# isNegative

- _isNegative(x)_

Answers `true` if _x_ is negative, else `false`.

Zero and one are not non-negative:

```
>>> 0.isNegative
false

>>> 1.isNegative
false
```

Negative one is negative:

```
>>> -1.isNegative
true
```

Negative zero is not negative,
because zero and negative zero compare as equal,
however it `isNegativeZero`:

```
>>> -0.isNegative
false

>>> -0.isNegativeZero
true
```

Threads over lists:

```
>>> [1.6, 3/4, 1.pi, 0, -5, (10 ^ 5).sin]
>>> .isNegative
[false false false false true false]
```

`Complex` numbers are never negative:

```
>>> [0J1 0J-1 -1J0].isNegative
[false false false]
```

* * *

See also: negate, isNonNegative, isPositive, isZero

Guides: Mathematical Functions, Predicate Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Negative.html)
[2](https://reference.wolfram.com/language/ref/Negative.html),
_Smalltalk_
5.6.2.23

Categories: Testing, Math
