# isRegularPrime

- _isRegularPrime(n)_

Answer `true` if _n_ is a regular prime.

Regular primes,
OEIS [A007703](https://oeis.org/A007703):

```
>>> 2:12.prime
[3 5 7 11 13 17 19 23 29 31 37]

>>> 2:12.prime.select(isRegularPrime:/1)
[3 5 7 11 13 17 19 23 29 31]
```

Irregular primes,
OEIS [A000928](https://oeis.org/A000928):

```
>>> 2:17.prime.reject(isRegularPrime:/1)
[37 59]
```

* * *

See also: bernoulliNumber, isPrime, numerator

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RegularPrime.html),
_OEIS_
[1](https://oeis.org/A007703)
