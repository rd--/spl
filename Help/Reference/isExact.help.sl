# isExact

- _isExact(x)_

Answer `true` if the number _x_ is an exact real or complex number, and `false` otherwise.

At `SmallFloat`,
answers `true` if `isSmallInteger` would answer `true`:

```
>>> 23.isExact
true

>>> 3.141.isExact
false

>>> (2 ^ 54).isExact
false
```

At `Complex` both real and imaginary parts of a complex number must be exact:

```
>>> 3J4.isExact
true

>>> 3.141J1.isExact
false

>>> 1J3.141.isExact
false
```

All `LargeInteger`, `Fraction`, `Decimal` and `Residue` values are exact:

```
>>> 23L.isExact
true

>>> 2/3.isExact
true

>>> 3.141D.isExact
true

>>> 5Z12.isExact
true
```

A `List` is not an exact number:

```
>>> { [1/2 3/4].isExact }.hasError
true

>>> [1/2 3/3].allTrue(isExact/1)
true
```

* * *

See also: isComplex, isFraction, isInteger, isNumber, isSmallFloat, isSmallInteger

Guides: Predicate Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ExactNumberQ.html)
