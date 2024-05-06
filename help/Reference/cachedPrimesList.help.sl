# cachedPrimesList

- _cachedPrimesList(aCache)_

Initially the list will hold the primes up to one hundred.

~~~
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

See also: primesList
