# isLesserCousinPrime

- _isLesserCousinPrime(n)_

Answer `true` if _n_ is the first (lesser) element of a cousin prime pair.
Cousin primes are pairs of primes of the form _(p, p + 4)_.

```
>>> (127.isLesserCousinPrime, 131.isPrime)
(true, true)

>>> 1:1483.select(
>>> 	isLesserCousinPrime:/1
>>> )
[
	   3    7   13   19   37
	  43   67   79   97  103
	 109  127  163  193  223
	 229  277  307  313  349
	 379  397  439  457  463
	 487  499  613  643  673
	 739  757  769  823  853
	 859  877  883  907  937
	 967 1009 1087 1093 1213
	1279 1297 1303 1423 1429
	1447 1483
]
```

* * *

See also: isLesserTwinPrime, isPrime, nextPrime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CousinPrimes.html),
_OEIS_
[1](https://oeis.org/A023200)
[2](https://oeis.org/A046132),
_W_
[1](https://en.wikipedia.org/wiki/Cousin_prime)

Categories: Testing
