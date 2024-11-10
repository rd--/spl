# copySignTo

- _copySignTo(aNumber, anotherNumber)_

Answer a number with same magnitude as _anotherNumber_ and the same sign as _aNumber_.

```
>>> -1.copySignTo(3)
-3
```

Equivalent to multiplying by the `sign` of _aNumber_:

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

See also: negated, sign, signBit
