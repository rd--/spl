# CacheStorage

A `Type` that holds a dictionary of `Cache` values.

The `caches` method answers the `CacheStorage` of the `system`.

`LibraryItem`s are cached at the key 'SplLibrary':

~~~spl async
system
.caches
.atIfPresent('SplLibrary') { :cache |
	cache.isCache
}
~~~

Delete cache:

~~~spl async
system
.caches
.removeKeyIfAbsent('SplLibrary') {
	'No such key'.postLine
}
~~~

* * *

See also: Cache, caches, system, System

References:
_W3c_
[1](https://w3c.github.io/ServiceWorker/#cachestorage-interface)
