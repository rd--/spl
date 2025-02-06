# Decimal

- _Decimal(aFraction, anInteger)_

`Decimal` is a numeric `Type` for fixed point decimal numbers.
It is able to accurately represent arbitrary precision decimal fractions.

Parse `String` as `Decimal`,
with and without fractional part:

```
>>> '3.1416D'.parseDecimal
3.1416D

>>> '23D'.parseDecimal
23D

>>> '20880467999847910614749358850048D'
>>> .parseDecimal
23n ^ 23
```

Literal syntax,
with and without fractional part:

```
>>> 3.1416D
3.1416D

>>> 23D
23D
```

Multiplication with integer:

```
>>> 3.1416D * 2
6.2832D

>>> 23 * 1.618D
37.214D
```

Division by integer:

```
>>> 3.1416D / 2
1.5708D

>>> 23 / 1.618D
14.215D
```

Addition with `Decimal` preserves greatest number of places:

```
>>> 1.30D + 1.20D
2.50D

>>> 3.14159D + 1.618D
4.75959D

>>> 3.141D + 1.61803D
4.75903D
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

Decimal values may be unequal even if their fraction and floating point values are equal:

```
>>> let x = 3/7.asDecimal(3);
>>> let y = 0.4290D;
>>> (
>>> 	(x, y),
>>> 	x = y,
>>> 	x.asFraction = y.asFraction,
>>> 	x.asFloat = y.asFloat
>>> )
((0.429D, 0.4290D), false, true, true)
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

The stored fraction is not necessarily the initial fraction:

```
>>> 1/3.asDecimal(2) * 3
0.99D

>>> 1/3.asDecimal(2).asFraction
33/100
```

Addition with integer preserves precision:

```
>>> 7.00D + 12
19.00D
```

Exact fraction:

```
>>> -3.14D.asFraction
-157/50
```

Multiplication extends precision:

```
>>> 1.3D * 1.2D
1.56D
```

Division:

```
>>> 1.00D / 7.00D
0.14D

>>> 1.000000D / 7.000000D
0.142857D
```

Integer and fraction parts:

```
>>> (23D ^ 23).integerPart
20880467999847912034355032910567D

>>> (3.141D ^ 54 - 1).fractionPart
0.463D
```

Absolute value:

```
>>> -23D.abs
23D

>>> -3.141D.abs
3.141D
```

Print `String`:

```
>>> 3.14159D.asString
'3.14159D'

>>> -1.618D.printString
'-1.618D'

>>> (23D ^ 23).printString
'20880467999847912034355032910567D'
```

* * *

See also: asDecimal, Complex, Fraction, LargeInteger, parseDecimal, SmallFloat

References:
_Python_
[1](https://docs.python.org/3/library/decimal.html)

Categories: Math, Type
