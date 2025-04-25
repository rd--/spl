# parseSmallInteger

- _parseSmallInteger(aString, radix=10)_

Answer the `SmallFloat` of the integer indicated by _aString_ which must be in _radix_ notation.
If the string is not an integer, signal an error.

Parse positive decimal integer:

```
>>> '23'.parseSmallInteger(10)
23
```

Parse negative decimal integer:

```
>>> '-23'.parseSmallInteger(10)
-23
```

Parse binary integers:

```
>>> '1001'.parseSmallInteger(2)
9

>>> '10101'.parseSmallInteger(2)
21
```

Parse hexadecimal integers:

```
>>> '11'.parseSmallInteger(16)
17

>>> 'FF'.parseSmallInteger(16)
255
```

Signal `error` on failure:

```
>>> {
>>> 	'three'.parseSmallInteger(10)
>>> }.ifError { true }
true
```

* * *

See also: parseDecimalInteger, parseFraction, parseLargeInteger, parseNumber, SmallFloat

Guides: Parsing Functions

Categories: Parsing
