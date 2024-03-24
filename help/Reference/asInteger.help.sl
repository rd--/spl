# asInteger

- _asInteger(aBoolean | aCharacter | anInteger | aNumber | aString)_

In the `Boolean` case, answer `asBit`:

```
>>> false.asInteger
0

>>> true.asInteger
1
```

In the `Character` case, answer `codePoint`:

```
>>> '~'.asCharacter.asInteger = 126
true
```

In the `Integer` case answer `identity`:

```
>>> 23.asInteger
23
```

In the `Number` case, i.e. `SmallFloat` or `Fraction`, answer `truncated`:

```
>>> pi.asInteger
3

>>> 22/7.asInteger
3
```

In the `String` case answer `parseDecimalInteger`:

```
>>> '23'.asInteger
23
```

* * *

See also: asBit, asFloat, asNumber, codePoint, parseDecimalInteger, truncated

References:
_Smalltalk_
5.6.2.16

Categories: Converting
