# isChenPrime

- _isChenPrime(n)_

Answer `true` if _n_ is a Chen prime,
primes _p_ such that _p+2_ is either a prime or a semiprime,
else `false`.

Chen primes,
OEIS [A109611](https://oeis.org/A109611):

```
>>> 1:101.select(isChenPrime:/1)
[
	 2  3  5  7 11 13 17 19 23 29
	31 37 41 47 53 59 67 71 83 89
	101
]
```

Primes that are not Chen primes,
OEIS [A102540](https://oeis.org/A102540):

```
>>> 1:151.select { :n |
>>> 	n.isPrime & { n.isChenPrime.not }
>>> }
[43 61 73 79 97 103 151]
```

Chen primes,
OEIS [A109611](https://oeis.org/A109611):

~~~spl svg=A oeis=A109611
1:600.select(isChenPrime:/1)
.discretePlot
~~~

![](Help/Image/isChenPrime-A.svg)

* * *

See also: isPrime, isLesserTwinPrime, isSemiprime

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ChenPrime.html),
_OEIS_
[1](https://oeis.org/A109611)
[2](https://oeis.org/A102540),
_W_
[1](https://en.wikipedia.org/wiki/Chen_prime)
