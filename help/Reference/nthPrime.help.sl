# nthPrime

- _nthPrime(anInteger)_

Answer the prime at index _anInteger_ in the sequence of prime numbers.

```
>>> 5.nthPrime
11

>>> 10.nthPrime
29

>>> 3579.nthPrime
33413
```

This value is cached (memoized) by the system,
so that subsequenct accesses do not require recalculation.

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

See also: isPrime, nextPrime, primesList, primesUpTo

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=ithprime),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Prime.html)

Categories: Math
