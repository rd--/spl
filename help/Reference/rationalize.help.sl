# rationalize

- _rationalize(aSmallFloat, epsilon)_
- _rationalize(α)_ ⇒ _rationalize(α, 1E-5)_

Answer a `Fraction` that approximates a floating point number given an error bound.

```
>>> pi.rationalize(1E-5)
355/113

>>> 6.75.rationalize(1E-2)
27/4

>>> 0.202898.rationalize(1E-4)
14/69
```

Find rational approximations to within a given tolerance:

```
>>> pi.rationalize(1E-2)
22/7

>>> 2.sqrt.exp.rationalize(1E-4)
218/53
```

Successive rational approximations to `pi`:

```
>>> -1:-10.collect { :n |
>>> 	1.pi.rationalize(10 ^ n)
>>> }
[
	16/5 22/7 201/64 333/106 355/113
	355/113 75948/24175 100798/32085
	103993/33102 312689/99532
]
```

At negative number:

```
>>> -0.220472.rationalize(0.0001)
-28/127
```

* * *

See also: asFraction, continuedFraction, convergents, limitDenominator, semiconvergents

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rationalize.html)

Categories: Converting, Math
