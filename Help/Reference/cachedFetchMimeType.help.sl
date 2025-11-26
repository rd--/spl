# cachedFetchMimeType

- _cachedFetchMimeType(url, cache, mimeType)_

A caching variant of `fetchMimeType`.
Runs `fetchMimeType` unless _url_ is not located in the named _cache_ at `caches`.

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

Guides: Network Functions

Categories: Network
