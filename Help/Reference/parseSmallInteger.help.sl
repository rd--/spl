# parseSmallInteger

- _parseSmallInteger(aString, radix=10)_
- _parseSmallInteger(aString, radix, elseClause:/0)_

Answer the `SmallFloat` of the integer indicated by _aString_ which must be in _radix_ notation.
If the string is not an integer, signal an error.

Parse positive decimal integer:

```
>>> '23'.parseSmallInteger(10)
23

>>> '+23'.parseSmallInteger(10)
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

>>> 2r1001
9

>>> '+10101'.parseSmallInteger(2)
21

>>> 2r10101
21

>>> '-1010'.parseSmallInteger(2)
-10

>>> -2r1010
-10
```

Parse octal integers:

```
>>> '1357'.parseSmallInteger(8)
751

>>> 8r1357
751

>>> '+6420'.parseSmallInteger(8)
3344

>>> 8r6420
3344

>>> '-01234567'.parseSmallInteger(8)
-342391

>>> -8r01234567
-342391
```

Parse hexadecimal integers:

```
>>> '11'.parseSmallInteger(16)
17

>>> 16r11
17

>>> 'FF'.parseSmallInteger(16)
255

>>> 16rFF
255

>>> '+AE'.parseSmallInteger(16)
174

>>> 16rAE
174

>>> '-BC'.parseSmallInteger(16)
-188

>>> -16rBC
-188
```

Evaluate _elseClause_ or signal an `error` on failure:

```
>>> '3.141'.parseSmallInteger(10) { nil }
nil

>>> {
>>> 	'three'.parseSmallInteger(10)
>>> }.hasError
true
```

* * *

See also: isRadixIntegerString, parseDecimalInteger, parseFraction, parseLargeInteger, parseNumber, SmallFloat

Guides: Integer Functions, Parsing Functions

Categories: Parsing
