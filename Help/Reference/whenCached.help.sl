# whenCached

- _whenCached(hasCache, key, aysncInitializerBlock:/0)_

A simple idiom to make accessing cached values nicer.
The answer will be a `Promise`, unlike with `cached`, so access to the answer is courtesy `then`.

This is ordinarily used by methods that provide access to system resources &etc. that are initialized on first access.

* * *

See also: atIfAbsentPut, Cache, cached

Categories: Accessing
