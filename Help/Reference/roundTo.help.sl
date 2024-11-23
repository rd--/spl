# roundTo

- _roundTo(aNumber, anotherNumber)_

Answer the nearest number to _aNumber_ that is a multiple of _anotherNumber_.

Round to integer:

```
>>> 3.99.roundTo(1)
4

>>> 4.01.roundTo(1)
4
```

Rounds away from zero, c.f. `roundToTowardsZero`:

```
>>> -3.99.roundTo(1)
-4
```

Round to precision:

```
>>> 3.1416.roundTo(1E4.reciprocal)
3.1416
```

Threads over lists:

```
>>> [1.5 2.5 3.5 4.5].roundTo(1)
[2 3 4 5]
```

* * *

See also: round, roundToTowardsZero, truncateTo

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NearestIntegerFunction.html)
[2](https://reference.wolfram.com/language/ref/Round.html),
_Smalltalk_
5.6.2.32

Categories: Truncating, Rounding
