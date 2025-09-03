# cached

- _cached(x, k, f:/0)_

Read the value associated with the key _k_ at the `cache` associated with the value _x_,
initializing the cache if required using the initializer block _f_.

This is a simple idiom to make accessing cached values nicer,
equivalent to `atIfAbsentPut` of `cache` of _x_.

It is ordinarily used by methods that provide access to lookup tables that are initialized on first access,
for instance `primesList`:

```
>>> 11.primesList
[2 3 5 7 11 13 17 19 23 29 31]

>>> system.cache['primesList'].first(11)
[2 3 5 7 11 13 17 19 23 29 31]
```

* * *

See also: atIfAbsentPut, Cache, whenCached

Guides: Dictionary Functions

Categories: Accessing
