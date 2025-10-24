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

At `Integer`, with precision elided:

```
>>> 23.asDecimal
23D
```

At `Fraction`:

```
>>> 1/3.asDecimal(2)
0.33D

>>> 355/113.asDecimal(4)
3.1416D

>>> 11/13.asDecimal(2)
0.85D
```

At negative `Fraction`:

```
>>> -11.00D / 13.00D
-0.8462D

>>> -13/11.asDecimal(6)
-1.181818D
```

At `SmallFloat`:

```
>>> 1.pi.asDecimal(5)
3.14159D
```

At `LargeInteger`:

```
>>> (2L ^ 54 - 1).asDecimal
18014398509481983D

>>> (23L ^ 23).asDecimal
20880467999847912034355032910567D

>>> 23L.asDecimal(23)
23.00000000000000000000000D
```

* * *

See also: asFloat, asInteger, Decimal
