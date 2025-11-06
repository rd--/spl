# Number Syntax

Guides:

- `Complex Number Syntax`
- `Decimal Number Syntax`
- `Fraction Syntax`
- `Integer Syntax`
- `Radix Syntax`
- `Real Number Syntax`
- `Scientific Notation`

Numbers may be written with a sign, which is part of the literal syntax.

```
>>> -23
23.negate
```

The sign may be either `+` or `-`:

```
>>> +23
23
```

Integer literals may have leading zeroes:

```
>>> [023 23]
[23 023]
```

`Scientific Notation`:

```
>>> 1E6
1000000

>>> 1E-3
0.001
```

`Fraction` literals:

```
>>> 7/5
Fraction(7, 5)
```

`Complex` literals:

```
>>> 3J4
Complex(3, 4)
```

`Decimal` literals:

```
>>> 3.1416D
3.1416D

>>> 0.1D5
0.10000D
```

`LargeInteger` literals:

```
>>> 23L ^ 23L
20880467999847912034355032910567L
```

Radix literals:

```
>>> 16rFE
254

>>> 2r101101110
366
```

* * *

See also: SmallFloat

Guides: Complex Number Syntax, Decimal Number Syntax, Fraction Syntax, Integer Syntax, Radix Syntax, Real Number Syntax, Scientific Notation

Categories: Syntax
