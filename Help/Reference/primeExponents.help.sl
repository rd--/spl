# primeExponents

- _primeExponents(n)_

Prime exponents in the factorization of the integer _n_.

An exponent of `zero` means that the corresponding prime is not a factor of `anInteger`.

```
>>> 700.primeExponents
[2 0 2 1]

>>> ([2 3 5 7] ^ [2 0 2 1]).product
700

>>> (2 * 3 * 5 * 17).primeExponents
[1 1 1 0 0 0 1]
```

* * *

See also: factorInteger, primeFactors

Guides: Prime Number Functions

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/qco#dyadic)
