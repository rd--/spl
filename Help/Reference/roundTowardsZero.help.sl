# roundTowardsZero

- _roundTowardsZero(n, α=1)_

Answer the nearest number to _n_ that is a multiple of _α_, rounding towards zero.
Equivalent to `truncate`.

Unary form:

```
>>> 0.9.roundTowardsZero
+0

>>> 0.9.truncate(1)
+0

>>> -0.9.roundTowardsZero
-0

>>> -0.9.truncate(1)
-0
```

Round to half integer:

```
>>> 0.9.roundTowardsZero(0.5)
+0.5

>>> 0.9.truncate(0.5)
+0.5

>>> -0.9.roundTowardsZero(0.5)
-0.5

>>> -0.9.truncate(0.5)
-0.5
```

Compare to `round`:

```
>>> -3.99.round
-4

>>> -3.99.roundTowardsZero
-3
```

* * *

See also: ceiling, floor, round, roundDown, roundUp, roundTiesEven, truncate

Guides: Rounding Functions
