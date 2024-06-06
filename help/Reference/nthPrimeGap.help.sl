# nthPrimeGap

- _nthPrimeGap(anInteger)_

A prime gap is the difference between two successive prime numbers.
The _n_-th prime gap is the difference between the _(n + 1)_-st and the _n_-th prime numbers.

```
>>> 1:20.collect(nthPrimeGap:/1)
[1 2 2 4 2 4 2 4 6 2 6 4 2 4 6 6 2 6 4 2]
```

Most frequent gaps in initial primes sequence:

```
>>> 2:999.collect(nthPrimeGap:/1).asBag.sortedCounts.take(4)
[
	244 -> 6,
	174 -> 2,
	169 -> 4,
	100 -> 10
]
```

Plot:

~~~
1:999.functionPlot(nthPrimeGap:/1)
~~~

* * *

See also: isPrime, nextPrime, nthPrime

References:
_OEIS_
[1](https://oeis.org/A001223),
_W_
[1](https://en.wikipedia.org/wiki/Prime_gap)
