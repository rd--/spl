# isFractionString

- _isFractionString(aString)_

Answer true if _aString_ would be parsed as a `Fraction` by `parseFraction`.

```
>>> '3/4'.isFractionString
true

>>> '-3/4'.isFractionString
true
```

The sign must be at the numerator:

```
>>> '3/-4'.isFractionString
false
```

The separator must be a solidus:

```
>>> '3:4'.isFractionString
false
```

* * *

See also: Fraction, parseFraction

Guides: Parsing Functions

Categories: Converting, Parsing
