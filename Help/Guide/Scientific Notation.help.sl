# Scientific Notation

The _scientific notation_ for a number is an expression of the form _m * (10 ^ n)_.
_m_ is called the coefficient and _n_ is called the exponent.
_m_ may be fractional, _n_ is required to be an integer.
In normalized or standard notation the value of _m_ is in the range _1 <= m < 10_.
One thousand is written _1 * (10 ^ 3)_, and one thousandth _1 * (10 ^ -3)_.

Engineering notation is a specific form of scientific notation where the exponent _n_ is restricted to multiples of three.

_E notation_ writes the number _m * (10 ^ n)_ as _mEn_.
One thousand is written _1E3_,
and one thousandth _1E-3_.

While in many implementations the _E_ may be written in either upper or lower case,
Sᴘʟ requires the E be in upper case.

Both small integer and floating point numbers may be written in E notation,
the answer is in both cases a `Float` value:

```
>>> 1.0E0
1

>>> 1.0E1
10

>>> 1.0E2
100

>>> 1.0E3
1000

>>> 1L * (10L ^ 3L)
1000L

>>> 1.0E-3
0.001

>>> 1L * (10L ^ -3L)
1/1000
```

The Planck length in metres:

```
>>> 1.6E-35
1.6 * (10L ^ -35)
```

The Avogadro number:

```
>>> 6.022E23
6.022 * (10L ^ 23)
```

The parser does not require that _1 <= a < 10_:

```
>>> 10.0E2
1.0E3
```

Equivalent `Integer` value:

```
>>> 10L ^ 20L
100000000000000000000L
```

* * *

See also: E, isScientificNotationString, parseScientificNotation

Guides: Number Syntax, Syntax Guides

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ScientificNotation.html),
_W_
[1](https://en.wikipedia.org/wiki/Scientific_notation)
