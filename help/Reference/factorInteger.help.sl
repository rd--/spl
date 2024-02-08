# factorInteger

- _factorInteger(anInteger)_

Answer the list of prime factors of _anInteger_, together with their exponents.

```
>>> 120.factorInteger
[2 -> 3, 3 -> 1, 5 -> 1]

>>> 36.factorInteger
[2 -> 3, 3 -> 2]
```

At Fraction:

```
>>> 3/8.factorInteger
[2 -> -3, 3 -> 1]
```

Threads over lists:

```
>>> [11 101 1001].factorInteger
[[11 -> 1], [101 -> 1], [7 -> 1, 11 -> 1, 13 -> 1]]
```

A unit factor:

```
-60.factorInteger
[-1 -> 1, 2 -> 2, 3 -> 1, 5 -> 1]
```

Use factorInteger to test for prime powers:

```
>>> 2401.factorInteger.size = 1
true

Use factorInteger to find all prime divisors of a number:

```
2434500.factorInteger.collect(key:/1)
[2 3 5 541]
```

Plot the number of distinct prime factors of the first 100 numbers:

```
1:99.collect { :each | each.factorInteger.size }.plot
```

* * *

See also: factorInteger, isPrime, product

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimeFactorization.html)
[2](https://reference.wolfram.com/language/ref/FactorInteger.html)

Categories: Arithmetic
