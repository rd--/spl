# primeFactorization

- _primeFactorization(n)_

Answer a `Multiset` giving the prime factors of the integer _n_ and their multiplicities (exponents).

```
>>> 21.primeFactorization
Multiset([3L 7L], ==)

>>> 36.primeFactorization
Multiset([2L 2L 3L 3L], ==)

>>> 60.primeFactorization
Multiset([2L 2L 3L 5L], ==)

>>> 120.primeFactorization
Multiset([2L 2L 2L 3L 5L], ==)

>>> 6.factorial.primeFactorization
Multiset([2L 2L 2L 2L 3L 3L 5L], ==)

>>> 2401.primeFactorization
Multiset([7L 7L 7L 7L], ==)

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

At `one`:

```
>>> 1.primeFactorization
Multiset([], ==)
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
>>> .sortedElements
[2 -> 2, 3 -> 4]

>>> 324.isPowerfulNumber
true
```

_Rationale_:
Not implemented at `Fraction` since the usual notation is for the exponent to be negative for factors of the denominator,
and a `Multiset` cannot have negative counts.

* * *

See also: factorInteger, primeFactors

Guides: Prime Number Functions
