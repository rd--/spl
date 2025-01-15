# caches

- _caches(aSystem)_

Answer the `CacheStorage` value associated with _aSystem_.

```
>>> system.caches.isCacheStorage
true
```

`LibraryItem` entries are cached at 'SplLibrary':

~~~
system
.caches
.includesKey('SplLibrary')
.then { :answer |
	answer.postLine
}
~~~

* * *

See also: Cache, CacheStorage, system, System

References:
_W3c_
[1](https://w3c.github.io/ServiceWorker/#self-caches)
