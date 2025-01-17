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

Plot first few places:

~~~spl svg=A
47.primesList.linePlot
~~~

![](sw/spl/Help/Image/primesList-A.svg)

* * *

See also: cachedPrimesList, isPrime, nextPrime, nthPrime, primesBetweenAnd, sieveOfEratosthenes

Categories: Primes
