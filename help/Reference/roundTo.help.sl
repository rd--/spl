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

Rounds away from zero, cf. `roundToTowardsZero`:

```
>>> -3.99.roundTo(1)
-4
```

* * *

See also: round, roundToTowardsZero, truncateTo

References:
_Smalltalk_
5.6.2.32

Categories: Truncating, Rounding
