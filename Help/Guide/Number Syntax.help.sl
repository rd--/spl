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

Integer literals allow underscores to be used as separators:

```
>>> 123_456_789
123456789
```

The seperators do not need to be in the traditional places:

```
>>> 12_34_56_78
123345678
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

Underscores are allowed:

```
>>> 123_456_789L
123456789L
```

Radix literals:

```
>>> 16rFE
254

>>> 2r101101110
366
```

Underscores are allowed:

```
>>> 2r1011_0111_0101
2r101101110101
```

* * *

See also: SmallFloat

Guides: Complex Number Syntax, Decimal Number Syntax, Fraction Syntax, Integer Syntax, Radix Syntax, Real Number Syntax, Scientific Notation

Categories: Syntax
