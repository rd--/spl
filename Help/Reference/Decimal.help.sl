# Decimal

- _Decimal(aFraction, anInteger)_

`Decimal` is a numeric `Type` for fixed point decimal numbers.
It is able to accurately represent arbitrary precision decimal fractions.

Parse `String` as `Decimal`:

```
>>> '3.1416'.parseDecimal
Decimal(3927/1250, 4)
```

Literal syntax:

```
>>> 3.1416D
Decimal(3927/1250, 4)
```

Multiplication with integer:

```
>>> 3.1416D * 2
Decimal(3927/625, 4)
```

Division by integer:

```
>>> 3.1416D / 2
Decimal(3927/2500, 4)
```

Addition preserves number of places:

```
>>> 1.30D + 1.20D
Decimal(5/2, 2)
```

`Decimal` values are equal only to other `Decimal` values with the same precision:

```
>>> 23.0D = 23.00D
false

>>> 23.0D = 23
false

>>> 23.0D = 23.0D
true
```

Decimal values may be equal even if their floating point values are disimilar:

```
>>> let x = 3/7.asDecimal(3);
>>> let y = 0.429D;
>>> (x, y, x = y, x.asFloat ~ y.asFloat)
(0.429D, 0.429D, true, false)
```

Exact addition, c.f. `SmallFloat`:

```
>>> 1.1D + 2.2D = 3.3D
true

>>> 1.1 + 2.2 = 3.3
false
```

Exact addition and subtraction, c.f. `SmallFloat`:

```
>>> (0.1D + 0.1D + 0.1D - 0.3D).isZero
true

>>> (0.1 + 0.1 + 0.1 - 0.3).isZero
false
```

Addition with integer preserves precision:

```
>>> 7.00D + 12
Decimal(19/1, 2)
```

Exact fraction:

```
>>> -3.14D.asFraction
-157/50
```

Multiplication extends precision:

```
>>> 1.3D * 1.2D
Decimal(39/25, 2)
```

Division:

```
>>> 1.00D / 7.00D
Decimal(1/7, 2)

>>> 1.000000D / 7.000000D
0.142857D
```

* * *

See also: Complex, Fraction, LargeInteger, SmallFloat

References:
_Python_
[1](https://docs.python.org/3/library/decimal.html)

Categories: Math, Type
