# cachedFetch

- _cachedFetch(aUrl | aLibraryItem, cacheName)_

A caching variant of `fetch`.
Runs `fetch` unless _aUrl_ is not located in _cacheName_ at `caches`.

Fetch a text file:

~~~spl async=String
let url = [
	'https://rohandrape.net/'
	'sw/spl/README.md'
].join('').asUrl;
url.cachedFetch(
	'*scratch*'
).then { :response |
	response.text
}
~~~

At `LibraryItem` initiates a `cachedFetch` of the contents,
and schedules for them to be added to the interpreter cache.

* * *

See also: Cache, CacheStorage, cachedFetchMimeType, fetch, fetchMimeType, Promise, Response

Categories: Network, Scheduling
