# primesList

- _primesList(anInteger)_

Answer the first _anInteger_ elements of the prime number sequence.

```
>>> 9.primesList
[2 3 5 7 11 13 17 19 23]
```

The primes `List` is cached (memoized) by the system:

```
>>> system.cachedPrimesList[9]
23
```

Plot first 500 places:

~~~
500.primesList.linePlot
~~~

* * *

See also: cachedPrimesList, isPrime, nextPrime, nthPrime

Categories: Primes
