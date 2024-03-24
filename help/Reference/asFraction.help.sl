# asFraction

- _asFraction(aFraction | aList | aSmallFloat)_

Convert an object to a `Fraction`.
In the `Fraction` case answer `identity`:

```
>>> 3/4.asFraction
3/4
```

In the `Integer` case, form `Fraction` above `one`:

```
>>> 23.asFraction
23/1
```

In the `Sequence` case require the `size` to be two and answer _n/d_ for _[n, d]_:

```
>>> [3 4].asFraction
3/4

>>> (5, 4).asFraction
5/4
```

In the `SmallFloat` case derive a `Fraction` using `rationalize`:

```
>>> pi.asFraction
355/113

>>> 6.75.asFraction
27/4

>>> 0.202898.asFraction
14/69
```

In the `SmallFloat` case a tolerance may be given:

```
>>> pi.asFraction(0.01)
22/7

>>> 2.sqrt.exp.asFraction(0.0001)
218/53
```

* * *

See also: asFloat, asInteger, asNumber, rationalize

References:
_Smalltalk_
5.6.2.15

Categories: Converting, Math
