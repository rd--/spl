# asInteger

- _asInteger(aBoolean | aCharacter | anInteger | aNumber | aString)_

In the Boolean case, answer _asBit_.

```
>>> false.asInteger
0

>>> true.asInteger
1
```

In the Character case, answer _codePoint_.

```
>>> '~'.asCharacter.asInteger = 126
true
```

In the Integer case answer _identity_.

```
>>> 23.asInteger
23
```

In the Number case, i.e. SmallFloat or Fraction, answer _truncated_.

```
>>> pi.asInteger
3

>>> 22/7.asInteger
3
```

In the String case answer _parseDecimalInteger_

```
>>> '23'.asInteger
23
```

* * *

See also: asBit, asFloat, asNumber, codePoint, parseDecimalInteger, truncated

Categories: Converting
