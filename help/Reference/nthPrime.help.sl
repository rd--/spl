# nthPrime

- _nthPrime(anInteger)_

Answer the prime at one-index _anInteger_ in the sequence of prime numbers.

```
>>> 5.nthPrime
11

>>> 10.nthPrime
29

>>> 2002.nthPrime
17401

>>> 3579.nthPrime
33413
```

The inverse is `primePi`:

```
>>> 33413.primePi
3579
```

Threads over lists:

```
>>> 1:9.nthPrime
[2 3 5 7 11 13 17 19 23]

>>> (10 ^ 1:3).nthPrime
[29 541 7919]
```

This value is cached (memoized) by the system,
so that subsequent accesses do not require recalculation:

```
>>> system.cache::primesList[5]
11

>>> system.cache::primesList[3579]
33413
```

Plot first fifty primes:

~~~
1:50.collect(nthPrime:/1).plot
~~~

* * *

See also: indexOfPrime, isPrime, nextPrime, primesList, primesUpTo

References:
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/pco),
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=ithprime),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Prime.html)

Categories: Math
