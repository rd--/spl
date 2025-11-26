# cachedFetch

- _cachedFetch(url, cache)_

A caching variant of `fetch`.
Runs `fetch` unless the `Url` _url_ is located in named `Cache` _cache_ at `caches`.

Fetch a text file:

~~~spl async
system
.splUrl('README.md')
.cachedFetch(
	'*scratch*'
).then { :response |
	response
	.text
}
~~~

At `LibraryItem` initiates a `cachedFetch` of the contents,
and schedules for them to be added to the interpreter cache.

* * *

See also: Cache, CacheStorage, cachedFetchMimeType, fetch, fetchMimeType, Promise, Response

Guides: Network Functions

Categories: Network, Scheduling
