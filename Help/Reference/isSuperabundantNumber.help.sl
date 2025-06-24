# isSuperabundantNumber

- _isSuperabundantNumber(n)_

Predicate to decide if _n_ is an abundant number.

```
>>> 1:120.select(isSuperabundantNumber:/1)
[1 2 4 6 12 24 36 48 60 120]
```

The first odd abundant number is 945:

```
>>> 945.isAbundantNumber
true
```

* * *

See also: aliquotSum, divisorSigma, isPerfectNumber

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SuperabundantNumber.html),
_OEIS_
[1](https://oeis.org/A004394),
_W_
[1](https://en.wikipedia.org/wiki/Superabundant_number)
