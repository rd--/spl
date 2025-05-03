# isScientificNotationString

- _isScientificNotationString(aString)_

In scientific notation, nonzero numbers are written in the form _m × (10 ^ n)_.
The exponent _n_ is an integer, the coefficient _m_ is a non-zero real number.
In E notation this is written _mEn_.
Answer `true` if _aString_ would be parsed as a `SmallFloat` by `parseScientificNotation`.

With integer coefficient:

```
>>> '3E4'.isScientificNotationString
true

>>> '-3E4'.isScientificNotationString
true

>>> '+3E4'.isScientificNotationString
true

>>> '3E-4'.isScientificNotationString
true

>>> '-3E-4'.isScientificNotationString
true

>>> '+3E+4'.isScientificNotationString
true
```

With fractional coefficient:

```
>>> '3.141E4'.isScientificNotationString
true

>>> '-3.141E4'.isScientificNotationString
true

>>> '3.141E-4'.isScientificNotationString
true

>>> '-3.141E-4'.isScientificNotationString
true
```

A decimal numeral is not in scientific notation:

```
>>> '23'.isScientificNotationString
false

>>> '3.141'.isScientificNotationString
false
```

* * *

See also: parseScientificNotation, SmallFloat

Guides: Parsing Functions

Categories: Converting, Parsing
