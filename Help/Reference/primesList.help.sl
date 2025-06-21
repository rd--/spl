# primesList

- _primesList(n)_

Answer the first _n_ elements of the prime number sequence.

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

Guides: Integer Sequences, Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A000040)

Categories: Primes
