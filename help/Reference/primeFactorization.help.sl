# primeFactorization

- _primeFactorization(anInteger)_

Answer a `Bag` giving the prime factors of `anInteger` and their multiplicities (exponents).

```
>>> 36.primeFactorization
[2 2 3 3].asBag

>>> 60.primeFactorization
[2 2 3 5].asBag

>>> 120.primeFactorization
[2 2 2 3 5].asBag

>>> 6.factorial.primeFactorization
[2 2 2 2 3 3 5].asBag

>>> 2401.primeFactorization
[7 7 7 7].asBag

>>> 20.factorial.primeFactorization.sortedElements
[2 -> 18, 3 -> 8, 5 -> 4, 7 -> 2, 11 -> 1, 13 -> 1, 17 -> 1, 19 -> 1]
```

The keys are the prime divisors:

```
>>> 2434500.primeFactorization.asMap.keys
[2 3 5 541]

>>> 2434500.primeDivisors
[2 3 5 541]
```

Powerful numbers are numbers whose prime factors are all repeated:

```
>>> 324.primeFactorization
[2 2 3 3 3 3].asBag

>>> 324.isPowerfulNumber
true
```

* * *

See also: factorInteger
