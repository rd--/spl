# parseInteger

- _parseInteger(aString, radix)_

Answer the `SmallFloat` of the integer indicated by _aString_ which must be in _radix_ notation.
If the string is not an integer, signal an error.

Parse positive decimal integer:

```
>>> '23'.parseInteger(10)
23
```

Parse negative decimal integer:

```
>>> '-23'.parseInteger(10)
-23
```

Parse binary integers:

```
>>> '1001'.parseInteger(2)
9

>>> '10101'.parseInteger(2)
21
```

Parse hexadecimal integers:

```
>>> '11'.parseInteger(16)
17

>>> 'FF'.parseInteger(16)
255
```

Signal `error` on failure:

```
>>> { 'three'.parseInteger(10) }.ifError { true }
true
```

* * *

See also: parseDecimalInteger, parseNumber

Categories: Parsing
