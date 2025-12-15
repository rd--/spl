# Decimal

- _Decimal(n/d, k)_

`Decimal` is a numeric `Type` for fixed point decimal numbers.
It is able to accurately represent arbitrary precision decimal fractions.

```
>>> Decimal(1/3, 3)
0.333D

>>> Decimal(7/13, 5)
0.53846D
```

The `scale` of a decimal is the number of places after the decimal point,
the `precision` is the total number of significant digits:

```
>>> let n = 1.2000000000000000000D;
>>> (n.scale, n.precision)
(19, 20)
```

Parse `String` as `Decimal`,
with and without fractional part:

```
>>> '3.1416D'.parseDecimal
3.1416D

>>> '23D'.parseDecimal
23D

>>> '20880467999847910614749358850048D'
>>> .parseDecimal
23L ^ 23
```

Literal syntax,
with and without fractional part and scale specifier:

```
>>> 3.1416D
3.1416D

>>> 23D
23D

>>> 2.1D4
2.1000D

>>> 3D3
3.000D
```

Multiplication with integer:

```
>>> 3.1416D * 2
6.2832D

>>> 23 * 1.618D
37.214D
```

Reciprocal retains scale, unless it is zero:

```
>>> [2D 2.0D 2.00D].reciprocal
[0.5D 0.5D 0.50D]

>>> [3D 3.0D 3.00D].reciprocal
[0.3D 0.3D 0.33D]

>>> [0.3D 0.33D 0.333D].reciprocal
[3.3D 3.03D 3.003D]
```

Division by integer:

```
>>> 3.1416D / 2
1.5708D

>>> 23 / 1.618D
14.215D

>>> (2.01D / 2, 2.01D * 0.5D)
(1.01D, 1.005D)

>>> 2.01D / 2.000D
1.005D
```

Addition with `Decimal` preserves greatest number of places:

```
>>> 1.30D + 1.20D
2.50D

>>> 1.15D + 1.35D
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
>>> let x = Decimal(3/7, 3);
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
>>> Decimal(1/3, 2) * 3
0.99D

>>> Decimal(1/3, 2).fraction
33/100
```

Addition with integer preserves precision:

```
>>> 7.00D + 12
19.00D
```

Exact fraction:

```
>>> -3.14D.fraction
-157/50

>>> -3.14D.asFraction
-157/50
```

Multiplication with `Decimal` follows the schoolbook approach and gives all of the figures in the multiplicands:

```
>>> 1.3D * 1.2D
1.56D

>>> 2.01D * 0.5D
1.005D

>>> 0.123D * 2.5D
0.3075D

>>> 0.123D * 4.84375D
0.59578125D
```

Division:

```
>>> 1.00D / 7.00D
0.14D

>>> 1.000D / 7.000D
0.143D

>>> 1 / 7.00D
0.14D

>>> 1.00D / 7
0.14D
```

Integer and fraction parts retain scale:

```
>>> (23D ^ 23).integerPart
20880467999847912034355032910567D

>>> 3.141D.integerPart
3.000D

>>> (3.141D ^ 54 - 1).fractionalPart
0.463D
```

A `Decimal` is an integer only the `scale` is `zero`:

```
>>> (3D.isInteger, 3D.scale)
(true, 0)

>>> 3.000D.isInteger
false

>>> 3D.asInteger
3

>>> {
>>> 	3.000D.asInteger
>>> }.hasError
true
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
>> 1.00000D.asString
1.00000D

>> 3.14159D.asString
3.14159D

>> -1.618D.printString
-1.618D

>> (23D ^ 23).printString
20880467999847912034355032910567D
```

Retrieve unscaled integer:

```
>>> 3.141D.unscaledInteger
3141
```

Retrieve digits of unscaled integer:

```
>>> 3.141D.integerDigits
[3 1 4 1]
```

Approximate comparison:

```
>>> 3.141592D ~ 1.pi
true
```

Store string:

```
>>> 3.14D.storeString
'Decimal(157/50, 2)'
```

_Note_:
The implentation is in terms of `Fraction`,
which is in terms of `LargeInteger`,
which may not have arbitrary precision.

* * *

See also: asDecimal, asDecimalFraction, Complex, Fraction, LargeInteger, parseDecimal, SmallFloat

Guides: Number Functions

References:
_Python_
[1](https://docs.python.org/3/library/decimal.html),
_W_
[1](https://en.wikipedia.org/wiki/Decimal)
[2](https://en.wikipedia.org/wiki/Fixed-point_arithmetic)

Categories: Math, Type
