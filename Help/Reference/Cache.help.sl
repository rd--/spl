# Cache

`Cache` is a `Trait` used to implement initialise-on-demand global variables.

The requried method is `cache`, which should answer a `Dictionary`.

Implements the methods `cached`, for where the initializer is synchronous, and `whenCached` for where it is not.

The `System` type, which is instantiated once as `system`, implements `Cache`.

The `primesList` method caches previous requests, and continues any required calculations from the cached answers.

```
>>> 23.primesList
system.cachedPrimesList.first(23)
```

`Cache` is also the `Type` of the persistent store for `fetch` responses.

~~~
system
.caches
.atIfPresent('SplLibrary') { :cache |
	cache.isCache.postLine
}
~~~

* * *

See also: cached, System, whenCached

Categories: System, Trait
