# cachedFetch

- _cachedFetch(aUrl, cacheName)_

Start the process of fetching a resource from the network,
returning a `Promise` which is fulfilled once the `Response` is available.

Fetch a text file:

~~~
let url = [
	'https://rohandrape.net/'
	'sw/spl/'
	'README.md'
].join('').asUrl;
url.cachedFetch('*scratch*').thenElse { :response |
	response.text.thenElse { :text |
		text.postLine
	} { :reason |
		reason.postLine
	}
} { :reason |
	reason.postLine
}
~~~

* * *

See also: Cache, CacheStorage, cachedFetchMimeType, fetch, Promise, Response

Categories: Network, Scheduling
