# roundTo

- _roundTo(x, a=1)_

Answer the nearest number to _x_ that is a multiple of _a_.

Round to integer:

```
>>> 3.99.roundTo(1)
4

>>> 4.01.roundTo(1)
4

>>> 2.675.roundTo(0.01)
2.68
```

Rounds away from zero, c.f. `roundTowardsZeroTo`:

```
>>> -3.99.roundTo(1)
-4
```

At half integers:

```
>>> 2.5.roundTo(1)
3

>>> 3.5.roundTo(1)
4

>>> -4.5.roundTo(1)
-4

>>> -5.5.roundTo(1)
-5
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

See also: round, roundDownTo, roundTowardsZeroTo, roundUpTo, truncateTo

References:
_Mathematica_
[1](https://mathworld.wolfram.com/NearestIntegerFunction.html)
[2](https://reference.wolfram.com/language/ref/Round.html),
_Smalltalk_
5.6.2.32

Categories: Truncating, Rounding
