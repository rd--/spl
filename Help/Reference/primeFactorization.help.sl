# primeFactorization

- _primeFactorization(n)_

Answer a `Multiset` giving the prime factors of the integer _n_ and their multiplicities (exponents).

```
>>> 21.primeFactorization
[3 7].Multiset

>>> 36.primeFactorization
[2 2 3 3].Multiset

>>> 60.primeFactorization
[2 2 3 5].Multiset

>>> 120.primeFactorization
[2 2 2 3 5].Multiset

>>> 6.factorial.primeFactorization
[2 2 2 2 3 3 5].Multiset

>>> 2401.primeFactorization
[7 7 7 7].Multiset

>>> 20L.factorial
>>> .primeFactorization
>>> .sortedElements
[
	2 -> 18,
	3 -> 8,
	5 -> 4,
	7 -> 2,
	11 -> 1,
	13 -> 1,
	17 -> 1,
	19 -> 1
]
```

The keys are the prime divisors:

```
>>> 2434500
>>> .primeFactorization
>>> .valuesAndCounts
>>> .keys
[2 3 5 541]

>>> 2434500.primeDivisors
[2 3 5 541]
```

Powerful numbers are numbers whose prime factors are all repeated:

```
>>> 324.primeFactorization
[2 2 3 3 3 3].Multiset

>>> 324.isPowerfulNumber
true
```

_Rationale_:
Not implemented at `Fraction` since the usual notation is for the exponent to be negative for factors of the denominator,
and an `IdentityMultiset` cannot have negative counts.

* * *

See also: factorInteger, primeFactors

Guides: Prime Number Functions
