# asInteger

- _asInteger(x)_

Answer the integer value nearest to the number _x_,
rounding towards zero if required.

In the `Integer` case this will answer a value that is equal to _x_,
however it may change the type of the value:

```
>>> let x = 23L;
>>> let y = x.asInteger;
>>> (y, x = y)
(23, true)

>>> let x = 23/1;
>>> let y = x.asInteger;
>>> (y, x = y)
(23, true)
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

In the `Number` case,
i.e. `SmallFloat` or `Fraction`,
answer `truncated`:

```
>>> 1.pi.asInteger
3

>>> 22/7.asInteger
3
```

To convert a `Boolean` to an integer use `asBit` or `boole`:

```
>>> false.asBit
0

>>> true.boole
1
```

To get the code point of a `Character` use `codePoint`:

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
>>> [23 23.3].asInteger
[23 23]
```

* * *

See also: asBit, asFloat, asNumber, codePoint, parseDecimalInteger, truncated

References:
_Smalltalk_
5.6.2.16

Categories: Converting
