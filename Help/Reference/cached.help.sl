# cached

- _cached(hasCache, key, aBlock:/0)_ ⟹ _atIfAbsentPut(hasCache.cache, key, aBlock:/0)_

A simple idiom to make accessing cached values nicer.
This is ordinarily used by methods that provide access to tables &etc. that are initialized on first access.

* * *

See also: atIfAbsentPut, Cache, whenCached

Categories: Accessing
