# primeNu

- _primeNu(x)_

Answer the number of distinct prime factors of _x_.

```
>>> 24.primeNu
2

>>> 24.distinctPrimeFactors
[2 3]

>>> 105.primeNu
3

>>> 105.distinctPrimeFactors
[3 5 7]
```

Compute for large integers:

```
>>> 50L.!.primeNu
15
```

`primeNu` is an additive function:

```
>>> (9 * 40).primeNu
9.primeNu + 40.primeNu
```

`primeNu` gives `one` for a prime power:

```
>>> 49.isPrimePower
true

>>> 49.primeNu
1
```

First few terms,
OEIS [A001221](https://oeis.org/A001221):

```
>>> 1:100.collect(primeNu:/1)
[
	0 1 1 1 1 2 1 1 1 2 1 2 1 2 2 1 1 2 1 2
	2 2 1 2 1 2 1 2 1 3 1 1 2 2 2 2 1 2 2 2
	1 3 1 2 2 2 1 2 1 2 2 2 1 2 2 2 2 2 1 3
	1 2 2 1 2 3 1 2 2 3 1 2 1 2 2 2 2 3 1 2
	1 2 1 3 2 2 2 2 1 3 2 2 2 2 2 2 1 2 2 2
]
```

The number of unitary divisors,
OEIS [A034444](https://oeis.org/A034444):

```
>>> 1:110.collect { :n |
>>> 	2 ^ n.primeNu
>>> }
[
	1 2 2 2 2 4 2 2 2 4 2 4 2 4 4 2 2 4 2 4
	4 4 2 4 2 4 2 4 2 8 2 2 4 4 4 4 2 4 4 4
	2 8 2 4 4 4 2 4 2 4 4 4 2 4 4 4 4 4 2 8
	2 4 4 2 4 8 2 4 4 8 2 4 2 4 4 4 4 8 2 4
	2 4 2 8 4 4 4 4 2 8 4 4 4 4 4 4 2 4 4 4
	2 8 2 4 8 4 2 4 2 8
]
```

Plot the `primeNu` sequence for the first 100 numbers:

~~~spl svg=A
1:100.functionPlot(primeNu:/1)
~~~

![](sw/spl/Help/Image/primeNu-A.svg)

* * *

See also: distinctPrimeFactors, factorInteger, gcd, isPrime, isPrimePower, isSquareFree, primeOmega

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DistinctPrimeFactors.html)
[2](https://reference.wolfram.com/language/ref/PrimeNu.html),
_OEIS_
[1](https://oeis.org/A001221)
[2](https://oeis.org/A034444),
_W_
[1](https://en.wikipedia.org/wiki/Prime_omega_function)

Categories: Math
