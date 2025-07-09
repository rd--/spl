# isChenPrime

- _isChenPrime(n)_

Answer `true` if _n_ is a Chen prime, else `false`.

The first few Chen primes:

```
>>> 1:101.select(isChenPrime:/1)
[
	 2  3  5  7 11 13 17 19 23 29
	31 37 41 47 53 59 67 71 83 89
	101
]
```

The first few primes that are not Chen primes:

```
>>> 1:151.select { :n |
>>> 	n.isPrime & { n.isChenPrime.not }
>>> }
[43 61 73 79 97 103 151]
```

* * *

See also: isPrime, isLesserTwinPrime, isSemiprime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChenPrime.html),
_OEIS_
[1](https://oeis.org/A109611),
_W_
[1](https://en.wikipedia.org/wiki/Chen_prime)
