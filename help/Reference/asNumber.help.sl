# asNumber

- _asNumber(aBoolean | aNumber | aString)_

In the `Boolean` case, answer `asBit`.

```
>>> false.asNumber
0

>>> true.asNumber
1
```

In the `Number` case answer `identity`.

```
>>> 23.asNumber
23

>>> 1.pi.asNumber
1.pi
```

In the `String` case answer `parseNumber`.

```
>>> '23'.asNumber
23

>>> '3.141'.asNumber
3.141
```

* * *

See also: asInteger

Categories: Converting
