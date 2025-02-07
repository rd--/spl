# cachedFetchMimeType

- _cachedFetchMimeType(aUrl, cacheName, aMimeType)_

A caching variant of `fetchMimeType`.
Runs `fetchMimeType` unless _aUrl_ is not located in _cacheName_ at `caches`.

Fetch Utf-8 encoded text:

~~~spl async
let mimeType = 'text/plain';
system
.splUrl('README.md')
.cachedFetchMimeType(
	'*scratch*',
	mimeType
)
~~~

* * *

See also: Cache, CacheStorage, cachedFetch, fetch, fetchMimeType, Url

Categories: Network
