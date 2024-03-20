# asFraction

- _asFraction(aSmallFloat, anInteger)_
- _asFraction(α)_ ⇒ _asFraction(α, 100)_

Derive a `Fraction` that approximates a floating point number given a maxima for the denominator.

```
>>> 1:3.collect { :n | 1.pi.asFraction(10 ^ n) }
[22/7 311/99 2862/911]

>>> 6.75.asFraction
27/4
```

Find rational approximations to within a given tolerance:

```
>>> pi.asFraction(7)
22/7

>>> 2.sqrt.exp.asFraction(53)
218/53
```

* * *

See also: asFloat, asInteger, asNumber, limitDenominator

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rationalize.html),
_Smalltalk_
5.6.2.15

Categories: Converting, Math
