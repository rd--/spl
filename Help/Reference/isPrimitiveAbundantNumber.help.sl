# isPrimitiveAbundantNumber

- _isPrimitiveAbundantNumber(n)_

Predicate to decide if _n_ is a primitive abundant number.

```
>>> 1:572.select(isPrimitiveAbundantNumber:/1)
[20 70 88 104 272 304 368 464 550 572]
```

The first odd primitive abundant number is 945:

```
>>> 945.isPrimitiveAbundantNumber
true
```

* * *

See also: aliquotSum, divisorSigma, isAbundantNumber, isDeficientNumber, isPerfectNumber

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimitiveAbundantNumber.html),
_OEIS_
[1](https://oeis.org/A071395),
_W_
[1](https://en.wikipedia.org/wiki/Primitive_abundant_number)
