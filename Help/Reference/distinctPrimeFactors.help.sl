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

* * *

See also: factorInteger, gcd, isPrime, isPrimePower, isSquareFree, primeNu, primeOmega

Guides: Prime Number Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DistinctPrimeFactors.html),
_W_
[1](https://en.wikipedia.org/wiki/Prime_omega_function)

Categories: Math
