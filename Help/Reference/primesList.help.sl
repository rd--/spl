# primesList

- _primesList(n)_

Answer the first _n_ elements of the prime number sequence.

The first nine primes,
OEIS [A000040](https://oeis.org/A000040):

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

See also: cachedPrimesList, isPrime, nextPrime, prime, primesBetweenAnd, sieveOfEratosthenes

Guides: Integer Sequence Functions, Prime Number Functions

References:
_OEIS_
[1](https://oeis.org/A000040)

Categories: Primes
