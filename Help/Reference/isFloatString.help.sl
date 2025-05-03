# isFloatString

- _isFloatString(aString)_

Answer true if _aString_ would be parsed as a floating point number by `parseNumber`.

This does not allow missing integral or fractional parts,
i.e. one must write _0.23_ not _.23_ and _23.0_ not _23._.

```
>>> '23'.isFloatString
true

>>> '3.141'.isFloatString
true

>>> '-23'.isFloatString
true

>>> '+1.618'.isFloatString
true
```

Allows scientific notation:

```
>>> '3.141E23'.isFloatString
true

>>> '3.141E-23'.isFloatString
true

>>> '-3.141E23'.isFloatString
true

>>> '-3.141E-23'.isFloatString
true
```

Infinities and non-numbers are not recognised:

```
>>> 'Infinity'.isFloatString
false

>>> '-Infinity'.isFloatString
false

>>> 'NaN'.isFloatString
false
```

The empty string answers `false`:

```
>>> ''.isFloatString
false
```

* * *

See also: asNumber, isDecimalIntegerString, parseNumber, RegExp

Guides: Parsing Functions

Categories: Testing
