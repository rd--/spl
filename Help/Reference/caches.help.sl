# caches

- _caches(system)_

Answer the `CacheStorage` value associated with `system`.

```
>>> system.caches.isCacheStorage
true
```

`LibraryItem` entries are cached at 'SplLibrary':

~~~spl async
system
.caches
.includesKey('SplLibrary')
~~~

Delete an item from the cache:

~~~spl async
let url = 'https://rohandrape.net/sw/hmt/data/json/masina-consonance-data.json'.asUrl;
system
.caches
.atIfPresent('SplLibraryItems') { :cache |
	cache
	.removeKeyIfAbsent(url) {
		'Not present'
	}
}
~~~

* * *

See also: Cache, CacheStorage, system, System

Guides: System Functions

References:
_W3c_
[1](https://w3c.github.io/ServiceWorker/#self-caches)
