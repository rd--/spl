# cached -- accessing

- _cached(where, key, aBlock)_ ⟹ _atIfAbsentPut(cache(where), key, aBlock)_

A simple idiom to make accessing cached values nicer.
This is ordinarily used by methods that provide access to tables &etc. that are initialized on first access.

* * *

See also: atIfAbsentPut, whenCached
