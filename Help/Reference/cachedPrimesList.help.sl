# cachedPrimesList

- _cachedPrimesList(aCache)_

A cache to memoize prime number calculations.
The usual interface is `primesList`.
Initially the cached list will hold the primes up to one hundred.

~~~
>>> system.cachedPrimesList.first(25)
[2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97]

>>> system.cachedPrimesList.size >= 25
true
~~~

The list can be extended to a specified index:

```
>>> system.cachedPrimesListExtendedToIndex(999).size >= 999
true
```

The list can be extended to a specified prime number:

```
>>> system.cachedPrimesListExtendedToPrime(7919).size >= 1000
true
```

* * *

See also: Cache, primesList

Categories: Math, System
