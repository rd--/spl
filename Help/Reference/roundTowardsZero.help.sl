# roundTowardsZero

- _roundTowardsZero(n, α=1)_

Answer the nearest number to _n_ that is a multiple of _α_, rounding towards zero.

Unary form:

```
>>> 0.9.roundTowardsZero
+0

>>> -0.9.roundTowardsZero
-0
```

Round to half integer:

```
>>> 0.9.roundTowardsZero(0.5)
+0.5

>>> -0.9.roundTowardsZero(0.5)
-0.5
```

* * *

See also: ceiling, floor, round, roundTiesEven, truncate

Guides: Rounding Functions
