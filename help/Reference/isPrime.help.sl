# isPrime

- _isPrime(anInteger)_

Determine if _anInteger_ is prime.

```
>>> 23.isPrime
true

>>> (11.factorial + 1).isPrime
true
```

Primes up to one hundred:

```
>>> 1:99.select(isPrime:/1)
[2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97]
```

Non-primes up to thirty:

```
>>> 1:30.reject(isPrime:/1)
[1 4 6 8 9 10 12 14 15 16 18 20 21 22 24 25 26 27 28 30]
```

Number of primes up to one-thousand:

```
>>> 1:999.select(isPrime:/1).size
168
```

Select primes:

```
>>> (1 .. 131).select(isPrime:/1)
[2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131]

>>> (827 .. 999).select(isPrime:/1)
[827 829 839 853 857 859 863 877 881 883 887 907 911 919 929 937 941 947 953 967 971 977 983 991 997]
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

>>> 0:24.isPrime.boole
[0 0 1 1 0 1 0 1 0 0 0 1 0 1 0 0 0 1 0 1 0 0 0 1 0]
```

Recognize Fermat primes, prime numbers of the form _2 ^ 2 ^ n + 1_:

```
>>> (2 ^ (2 ^ 3) + 1).isPrime
true
```

The number _2 ^ 2 ^ 7 + 1_ is not a Fermat prime, & requires _millerRabinPrimalityTest_:

```
>>> (2n ^ (2 ^ 7) + 1).millerRabinPrimalityTest(10)
false
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

At `zero` and `one`:

```
>>> [0 1].isPrime
[false false]
```

Plot primes up to one-hundred-thousand:

~~~
1:99999.select(isPrime:/1).plot
~~~

* * *

See also: isGaussianPrime, isPrimePower, nextPrime, nthPrime

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco#dyadic),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=isprime),
_Mathematica_
[1](https://mathworld.wolfram.com/Primes.html)
[2](https://reference.wolfram.com/language/ref/PrimeQ.html)

Categories: Arithmetic
