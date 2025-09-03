# whenCached

- _whenCached(x, k, f:/0)_

Read the value associated with the key _k_ at the `cache` associated with the value _x_,
initializing the cache if required using the asynchronous initializer block _f_.
The answer is a `Promise`,
unlike with `cached`,
so access to the cached resource is courtesy `then`.

This is ordinarily used by methods that provide access to system resources that are initialized on first access.

* * *

See also: atIfAbsentPut, Cache, cached

Guides: Dictionary Functions

Categories: Accessing
