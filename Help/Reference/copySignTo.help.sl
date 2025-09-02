# copySignTo

- _copySignTo(x, y)_

Answer a number with same magnitude as the number _y_ and the same sign as the number _x_.

```
>>> -1.copySignTo(3)
-3
```

Equivalent to multiplying by the `sign` of _x_:

```
>>> 3 * -1.sign
-3
```

Copy sign to `zero`:

```
>>> -1.copySignTo(0)
-0
```

* * *

See also: negate, sign, signBit
