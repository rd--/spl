# asFloat

- _asFloat(aNumber)_

Answer a `SmallFloat` that closely approximates the value of _aNumber_.

At `SmallFloat`:

```
>>> 23.asFloat
23.0

>>> 1.pi.asFloat
1.pi
```

At `Fraction`:

```
>>> 3/4.asFloat
0.75
```

At `LargeInteger`:

```
>>> 23n.asFloat
23
```

* * *

See also: asInteger, asNumber

References:
_Smalltalk_
5.6.2.11

Categories: Converting
