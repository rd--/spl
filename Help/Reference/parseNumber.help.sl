# parseNumber

- _parseNumber(aString)_

Answer the `SmallFloat` represented by _aString_,
else signal an `error`.

Parse decimal integer:

```
>>> '23'.parseNumber
23
```

Parse negative decimal integer:

```
>>> '-23'.parseNumber
-23
```

Parse decimal real number:

```
>>> '3.141'.parseNumber
3.141
```

Parse negative decimal real number:

```
>>> '-672.433244'.parseNumber
-672.433244
```

Parse negative zero:

```
>>> '-0'.parseNumber
-0
```

Parse scientific notation:

```
>>> '1E6'.parseNumber
1E6

>>> '-1E6'.parseNumber
-1E6

>>> '1E-6'.parseNumber
1E-6

>>> '-1E-6'.parseNumber
-1E-6

>>> '3.141E3'.parseNumber
3.141E3

>>> '-3.141E3'.parseNumber
-3.141E3
```

Does not parse infinity:

```
>>> {
>>> 	'Infinity'.parseNumber
>>> }.ifError { true }
true
```

Does not parse radix notation,
signals `error` on failure:

```
>>> {
>>> 	'2r1001'.parseNumber
>>> }.ifError { true }
true

>>> 2r1001
10r9
```

* * *

See also: Number, parseDecimalInteger, parseFraction, parseLargeInteger, parseSmallInteger, printString, storeString

Guides: Parsing Functions

Categories: Parsing
