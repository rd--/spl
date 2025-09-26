# asInteger

- _asInteger(x)_

Answer the integer value nearest to the number _x_,
rounding towards zero if required.

In the `Integer` case this will answer a value that is equal to _x_,
however it may change the type of the value:

```
>>> let x = 23L;
>>> let y = x.asInteger;
>>> (y, x = y, x == y)
(23, true, false)

>>> let x = 23/1;
>>> let y = x.asInteger;
>>> (y, x = y, x == y)
(23, true, false)
```

At `LargeInteger`,
answers a `SmallFloat` if the value would answer `true` for `isSmallInteger`:

```
>>> let x = 23L.asInteger;
>>> (x, x.isLargeInteger)
(23, false)

>>> let x = (2L ^ 54).asInteger;
>>> (x, x.isLargeInteger)
(18014398509481984L, true)
```

If a `SmallFloat`, `Fraction` and `Decimal` it is not an integer it is an error:

```
>>> { 1.pi.asInteger }.hasError
true

>>> { 22/7.asInteger }.hasError
true

>>> { 3.142D.asInteger }.hasError
true
```

To convert a non-integer to an integer use `round` or `ceiling` or `floor` or `truncate`:

```
>>> let x = 1.pi;
>>> (x.round, x.floor, x.ceiling, x.truncate)
(3, 3, 4, 3)

To convert a `Boolean` to an integer use `asBit` or `boole`:

```
>>> false.asBit
0

>>> true.boole
1
```

Not defined at `String`:

```
>>> {
>>> 	'1'.asInteger
>>> }.hasError
true
```

To get the code point of a character use `codePoint`:

```
>>> '~'.codePoint
126
```

To parse a `String` as an integer use `parseDecimalInteger`:

```
>>> '23'.parseDecimalInteger
23
```

Threads over lists:

```
>>> [23 23.0 23L].asInteger
[23 23 23]
```

* * *

See also: asBit, asFloat, asNumber, asLargeInteger, asSmallInteger, codePoint, parseDecimalInteger, truncate

Guides: Integer Functions, Number Functions

References:
_Smalltalk_
5.6.2.16

Categories: Converting
