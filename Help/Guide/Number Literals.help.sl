# Number Literals

Numbers may be written with a sign, which is part of the literal syntax.

```
>>> -23
23.negated
```

The sign may be either `+` or `-`:

```
>>> +23.negated
-23
```

Integer literals may have leading zeroes:

```
>>> [023 23]
[23 023]
```

The _scientific notation_ for a number _n_ is an equivalent expression _a * (10 ^ p)_,
where _1 <= a < 10_.
_a_ may be fractional, _p_ is required to be an integer.
One thousand is written _1 * (10 ^ 3)_, and one thousandth _1 * (10 ^ -3)_.

_E notation_ writes this number as _aEp_.
One thousand is written _1E3_, and one thousandth _1E-3_.

The _E_ may be written in either upper or lower case,
the Sᴘʟ standard libraries and help files write the E capitalised.

Both integer and floating point numbers may be written in E notation,
the answer is in both cases a `SmallFloat` value:

```
>>> 1E3
1000

>>> 1E-3
1 * (10 ^ -3)
```

The Planck length in metres:

```
>>> 1.6E-35
1.6 * (10 ^ -35)
```

The Avogadro number:

```
>>> 6.022E23
6.022 * (10 ^ 23)
```

The parser does not require that _1 <= a < 10_:

```
>>> 10E2
1E3
```

* * *

See also: SmallFloat

Guides: Complex Literals, Fraction Literals, Integer Literals, Literals Syntax, Radix Syntax

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScientificNotation.html),
_W_
[1](https://en.wikipedia.org/wiki/Scientific_notation)

Categories: Syntax
