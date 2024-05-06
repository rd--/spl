# Cache

Cache is used to implement initialise-on-demand global variables.

The requried method is `cache`, which should answer a `Dictionary`.

Implements the methods `cached`, for where the initializer is synchronous, and `whenCached` for where is is not.

The `System` type, which is instantiated once as `system`, implements `Cache`.

The `primesList` method caches previous requests, and continues any required calculations from the cached answers.

```
>>> 23.primesList
system.cachedPrimesList.first(23)
```

* * *

See also: cached, System, whenCached

Categories: Trait
