# asNumber

- _asNumber(aNumber)_

Answer _aNumber_, if it is a number, else error.

In the `Number` case answer `identity`.

```
>>> 23.asNumber
23

>>> 1.pi.asNumber
1.pi
```

To convert a `Boolean` use `asBit` or `boole`:

```
>>> false.asBit
0

>>> true.boole
1
```

To convert a `String` use `parseNumber`:

```
>>> '23'.parseNumber
23

>>> '3.141'.parseNumber
3.141
```

* * *

See also: asBit, asInteger, boole, parseNumber

Categories: Converting
