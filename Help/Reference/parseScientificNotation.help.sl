# parseScientificNotation

- _parseScientificNotation(aString)_

In scientific notation, nonzero numbers are written in the form _m × (10 ^ n)_.
The exponent _n_ is an integer, the coefficient _m_ is a non-zero real number.
In E notation this is written _mEn_.
Answer `true` if _aString_ would be parsed as a `SmallFloat` by `parseScientificNotation`.

With integer coefficient:

```
>>> '3E4'.parseScientificNotation
30000

>>> '-3E4'.parseScientificNotation
-30000

>>> '+3E4'.parseScientificNotation
30000

>>> '3E-4'.parseScientificNotation
0.0003

>>> '-3E-4'.parseScientificNotation
-0.0003

>>> '+3E+4'.parseScientificNotation
30000
```

With fractional coefficient:

```
>>> '3.141E4'.parseScientificNotation
31410

>>> '-3.141E4'.parseScientificNotation
-31410

>>> '3.141E-4'.parseScientificNotation
0.0003141

>>> '-3.141E-4'.parseScientificNotation
-0.0003141
```

A decimal numeral is not in scientific notation:

```
>>> '23'.parseScientificNotation { nil }
nil

>>> {
>>> 	'3.141'.parseScientificNotation
>>> }.hasError
true
```

* * *

See also: parseScientificNotation, SmallFloat

Guides: Parsing Functions

Categories: Converting, Parsing
