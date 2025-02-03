# asInteger

- _asInteger(aNumber)_

In the `Integer` case answer `identity`:

```
>>> 23.asInteger
23
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
