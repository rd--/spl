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

Dispersion of the primes,
OEIS [A114537](https://oeis.org/A114537)

```
>>> { :n :k |
>>> 	prime:/1.iterate(n.nonPrime, k)
>>> }.table(0:5, 0:5)
[
	 1   2    3    5    11    31;
	 4   7   17   59   277  1787;
	 6  13   41  179  1063  8527;
	 8  19   67  331  2221 19577;
	 9  23   83  431  3001 27457;
	10  29  109  599  4397 42043
]
```

Plot characteristic function of nonprimes,
OEIS[A005171](https://oeis.org/A005171):

~~~spl svg=A
1:75.collect { :n |
	n.isPrime.not.boole
}.discretePlot
~~~

![](sw/spl/Help/Image/nonPrime-A.svg)

Plot dispersion of the primes,
OEIS [A114537](https://oeis.org/A114537)

~~~spl svg=B
10.antidiagonalArray { :n :k |
	prime:/1.iterate(
		(n - 1).nonPrime,
		k - 1
	)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/nonPrime-B.svg)

* * *

See also: fixedPoint, prime, primePi

Guides: Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A018252)
