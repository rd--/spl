# asFloat

- _asFloat(x)_

Answer a `SmallFloat` that closely approximates the value of the number _x_.

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
>>> 23L.asFloat
23
```

Threads over lists:

```
>>> [3/4 23L].asFloat
[0.75 23]
```

_Note:_
At present there is only one floating point type,
and `asFloat` is simply an alias for `asSmallFloat`.

* * *

See also: asInteger, asNumber

Guides: Number Functions

References:
_Smalltalk_
5.6.2.11

Categories: Converting
