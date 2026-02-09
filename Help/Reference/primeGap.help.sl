# primeGap

- _primeGap(n)_

Answer the _n_-th prime gap.
A prime gap is the difference between two successive prime numbers.
The _n_-th prime gap is the difference between the _n+1_-th and the _n_-th prime numbers.

First few terms,
OEIS [A001223](https://oeis.org/A001223):

```
>>> 1:20.collect(primeGap:/1)
[
	1 2 2 4 2 4 2 4 6 2
	6 4 2 4 6 6 2 6 4 2
]
```

Most frequent gaps in initial primes sequence:

```
>>> 2:999
>>> .collect(primeGap:/1)
>>> .asIdentityMultiset
>>> .sortedCounts
>>> .take(4)
[
	244 -> 6,
	174 -> 2,
	169 -> 4,
	100 -> 10
]
```

Differences between record prime gaps,
OEIS [A053695](https://oeis.org/A053695):

```
>>> 1:2000.collect(primeGap:/1)
>>> .recordValues
>>> .differences
[1 2 2 2 6 4 2 2 12 2 8]
```

Primes followed by a larger-than-average prime gap,
OEIS [A082885](https://oeis.org/A082885):

```
>>> 1:23.select { :n |
>>> 	(n.primeGap / n.prime.log) > 1
>>> }.prime
[2 3 5 7 13 19 23 31 37 43 47 53 61 73 83]
```

Plot first few terms,
OEIS [A001223](https://oeis.org/A001223):

~~~spl svg=A
1:99.functionPlot(primeGap:/1)
~~~

![](sw/spl/Help/Image/primeGap-A.svg)

Scatter plot of first few terms:

~~~spl svg=B
1:200.collect(primeGap:/1)
.scatterPlot
~~~

![](sw/spl/Help/Image/primeGap-B.svg)

* * *

See also: isPrime, nextPrime, prime

Guides: Prime Number Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeGaps.html),
_OEIS_
[1](https://oeis.org/A001223),
_W_
[1](https://en.wikipedia.org/wiki/Prime_gap)
