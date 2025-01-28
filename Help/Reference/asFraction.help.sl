# asFraction

- _asFraction(aNumber)_

Convert _aNumber_ to a `Fraction`.

In the `Fraction` case answer `identity`:

```
>>> 3/4.asFraction
3/4
```

In the `Integer` case, answer a `Fraction` above `one`:

```
>>> 23.asFraction
23/1

>>> -23.asFraction
-23/1
```

In the `SmallFloat` case derive a `Fraction` using `rationalize`:

```
>>> 1.pi.asFraction
355/113

>>> 6.75.asFraction
27/4

>>> 0.202898.asFraction
14/69
```

In the `SmallFloat` case a tolerance may be given:

```
>>> 1.pi.asFraction(0.01)
22/7

>>> 2.sqrt.exp.asFraction(0.0001)
218/53
```

Threads over lists:

```
>>> [0.25 0.5 0.75].asFraction
[1/4 1/2 3/4]
```

At negative numbers:

```
>>> -0.22047.asFraction
-28/127
```

* * *

See also: asApproximateFraction, asFloat, asInteger, asNumber, rationalize

References:
_Smalltalk_
5.6.2.15

Categories: Converting, Math
