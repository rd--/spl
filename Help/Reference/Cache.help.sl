# Cache

`Cache` is a `Trait` used to implement initialise-on-demand global variables.

The required method is `cache`, which should answer a `Dictionary`.

Implements the methods `cached`, for where the initializer is synchronous, and `whenCached` for where it is not.

The `System` type, which is instantiated once as `system`, implements `Cache`.

The `primesList` method caches previous requests, and continues any required calculations from the cached answers.

```
>>> 23.primesList
system.cache['primesList'].first(23)
```

`Cache` is also the `Type` of the persistent store for `fetch` results,
where the keys are `Request` or `Url` objects,
and values are `Response` objects.

~~~spl async
system
.caches
.atIfPresent('SplLibrary') { :cache |
	cache.isCache
}
~~~

This cache is not an ordinary dictionary type,
however it does implement:

- `atIfAbsent`
- `atIfPresentIfAbsent`
- `atIfPresent`
- `atPut`
- `removeKeyIfAbsent`

Remove an item from the 'SplLibrary' cache:

~~~spl async effect=cache
system
.caches
.atIfPresent('SplLibraryItems') { :cache |
	cache.removeKeyIfAbsent(
		system.library['McClurePolyhedraCatalogue'].url.asUrl
	) {
		'Not present'
	}
}
~~~

* * *

See also: cached, caches, CacheStorage, LibraryItem, System, whenCached

References:
_W3c_
[1](https://w3c.github.io/ServiceWorker/#cache-interface)

Categories: System, Trait
