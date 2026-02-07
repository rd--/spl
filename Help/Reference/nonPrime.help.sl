# nonPrime

- _nonPrime(n)_

Answer the _n_-th non-prime number.
The zero-th non-prime is `one`.

First few terms
OEIS [A018252](https://oeis.org/A018252):

```
>>> 0:23.nonPrime
[
	 1  4  6  8  9 10 12 14 15 16
	18 20 21 22 24 25 26 27 28 30
	32 33 34 35
]
```

The complement of the primes:

```
>>> 1:11.prime
[2 3 5 7 11 13 17 19 23 29 31]

>>> let a = 1:11.prime;
>>> let b = 0:23.nonPrime;
>>> (a ++ b).sort
[1 .. 35]
```

* * *

See also: fixedPoint, prime, primePi

Guides: Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A018252)
