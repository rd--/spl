# distinctPrimeFactors

- _distinctPrimeFactors(x)_

Answer the distinct prime factors of _x_.

```
>>> 24.distinctPrimeFactors
[2 3]

>>> 24.primeNu
2

>>> 105.distinctPrimeFactors
[3 5 7]

>>> 105.primeNu
3

>>> 2434500.distinctPrimeFactors
[2 3 5 541]
```

Compute for large integers:

```
>>> 50L.!.distinctPrimeFactors
[
	 2  3  5  7 11
	13 17 19 23 29
	31 37 41 43 47
]
```

At a prime power:

```
>>> 49.isPrimePower
true

>>> 49.distinctPrimeFactors
[7]
```

First few terms,
OEIS [A027748](https://oeis.org/A027748):

```
>>> 2:23.collect(distinctPrimeFactors:/1)
[
	2;
	3;
	2;
	5;
	2 3;
	7;
	2;
	3;
	2 5;
	11;
	2 3;
	13;
	2 7;
	3 5;
	2;
	17;
	2 3;
	19;
	2 5;
	3 7;
	2 11;
	23
]
```

Plot sum of the distinct prime factors of _n_,
OEIS [A008472](https://oeis.org/A008472):

~~~spl svg=A
1:75.collect { :n |
	n.distinctPrimeFactors.sum
}.scatterPlot
~~~

![](sw/spl/Help/Image/distinctPrimeFactors-A.svg)

Plot table,
OEIS [A027748](https://oeis.org/A027748):

~~~spl svg=B
2:115.collect(distinctPrimeFactors:/1)
.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/distinctPrimeFactors-B.svg)

* * *

See also: factorInteger, gcd, isPrime, isPrimePower, isSquareFree, primeNu, primeOmega

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DistinctPrimeFactors.html),
_OEIS_
[1](https://oeis.org/A008472),
_W_
[1](https://en.wikipedia.org/wiki/Prime_omega_function)

Categories: Math
