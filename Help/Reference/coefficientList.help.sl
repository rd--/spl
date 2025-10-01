# coefficientList

- _coefficientList(p)_

Answer a list of coefficients of the polynomial _p_, starting with power `zero`.

```
>>> 7.chebyshevT.coefficientList
[0 -7 0 56 0 -112 0 64]

>>> 11.chebyshevT.coefficientList
[0 -11 0 220 0 -1232 0 2816 0 -2816 0 1024]

>>> (7.chebyshevT + 11.chebyshevT)
>>> .coefficientList
[0 -18 0 276 0 -1344 0 2880 0 -2816 0 1024]
```

* * *

See also: UnivariatePolynomial

Guides: Polynomial Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CoefficientList.html)
