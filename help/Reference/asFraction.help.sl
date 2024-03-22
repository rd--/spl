# asFraction

- _asFraction(aSmallFloat, epsilon)_
- _asFraction(α)_ ⇒ _asFraction(α, 0.0001)_

Derive a `Fraction` that approximates a floating point number given an error bound.

```
>>> pi.asFraction(1E-5)
355/113

>>> 6.75.asFraction
27/4
```

Find rational approximations to within a given tolerance:

```
>>> pi.asFraction(0.01)
22/7

>>> 2.sqrt.exp.asFraction(0.0001)
218/53
```

Successive rational approximations to :

```
>>> -1:-10.collect { :n | 1.pi.asFraction(10 ^ n) }
[16/5 22/7 201/64 333/106 355/113 355/113 75948/24175 100798/32085 103993/33102 312689/99532]
```

* * *

See also: asFloat, asInteger, asNumber, continuedFraction, convergents, limitDenominator

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rationalize.html),
_Smalltalk_
5.6.2.15

Categories: Converting, Math
