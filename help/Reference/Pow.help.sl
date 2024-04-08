# Pow

- _Pow(aNumber, anotherNumber)_

This method extends the usual definition of exponentiation and for negative _i_ in _Pow(i, j)_ answers _Neg(Pow(Neg(i), j))_.

This behavior allows exponentiation of negative signal values by noninteger exponents.

```
>>> -0.25.Pow(0.75)
-0.353553
```

Compare with `^`:

```
>>> -0.25J0 ^ 0.75
-0.25J0.25
```

* * *

See also: ^, Exp, Log, Sqrt

Categories: Math operator
