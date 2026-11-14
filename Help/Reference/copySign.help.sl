# copySign

- _copySign(x, y)_

Answer a number with same magnitude as the number _y_ and the same sign as the number _x_.

```
>>> -1.0.copySign(3.0)
-3.0

>>> -1L.copySign(3L)
-3L
```

Equivalent to multiplying by the `sign` of _x_:

```
>>> 3.0 * -1.0.sign
-3.0

>>> 3L * -1L.sign
-3L
```

Copy sign to `zero`:

```
>>> -1.0.copySign(0.0)
-0.0
```

To `Infinity`:

```
>>> -5/3.copySign(Infinity)
-Infinity
```

* * *

See also: negate, sign, signBit

Guides: Copying Functions, Mathematical Functions
