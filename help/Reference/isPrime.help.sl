# isPrime

_isPrime(anInteger)_

Determine if _anInteger_ is prime.

```
>>> 23.isPrime
true
```

Primes up to one hundred:

```
>>> 1:99.select(isPrime:/1)
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
```

Number of primes up to one-thousand:

```
>>> 1:999.select(isPrime:/1).size
168
```

Number of primes up to ten-thousand:

```
>>> 1:9999.select(isPrime:/1).size
1229
```

Test for large integers:

```
>>> (10n ^ 3000 + 1).isPrime
false
```

Threads over lists:

```
>>> 1:6.isPrime
[false true true false true false]
```

Recognize Wieferich primes, prime numbers _p_ such that _p^2_ divides _2^(p-1) - 1_:

```
>>> let f = { :n | n.isPrime & { (2 ^ (n - 1) - 1) % (n ^ 2) = 0 } };
>>> (1n .. 9999n).select(f:/1)
[1093n, 3511n]
```

Find twin primes:

```
>>> 1:333.select { :each | each.isPrime & { each.nextPrime = (each + 2) } }
[3 5 11 17 29 41 59 71 101 107 137 149 179 191 197 227 239 269 281 311]
```

Plot primes up to one-hundred-thousand:

```
1:99999.select(isPrime:/1).plot
```

* * *

See also: isGaussianPrime, isPrimePower, nextPrime, nthPrime

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Primes.html)
[2](https://reference.wolfram.com/language/ref/PrimeQ.html)

Categories: Arithmetic
