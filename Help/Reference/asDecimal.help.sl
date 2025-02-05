# asDecimal

- _asDecimal(aNumber, anInteger)_

Answer a `Decimal` value representing _aNumber_ to precision _anInteger_.

At `Decimal`:

```
>>> 3.141D.asDecimal(2)
3.14D

>>> 3.14D.asDecimal(3)
3.140D
```

At `Integer`:

```
>>> 23.asDecimal(2)
23.00D
```

At `Fraction`:

```
>>> 1/3.asDecimal(2)
0.33D
```

At `SmallFloat`:

```
>>> 1.pi.asDecimal(5)
3.14159D
```

* * *

See also: asFloat, asInteger, Decimal
