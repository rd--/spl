# cached

- _cached(hasCache, key, aBlock:/0)_ ⟹ _atIfAbsentPut(hasCache.cache, key, aBlock:/0)_

A simple idiom to make accessing cached values nicer.
This is ordinarily used by methods that provide access to tables &etc. that are initialized on first access,
for instance `primesList`:

```
>>> 11.primesList
[2 3 5 7 11 13 17 19 23 29 31]

>>> system.cache['primesList'].first(11)
[2 3 5 7 11 13 17 19 23 29 31]
```


* * *

See also: atIfAbsentPut, Cache, whenCached

Categories: Accessing
