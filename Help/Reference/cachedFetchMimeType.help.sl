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

'https://rohandrape.net/sw/hsc3-data/data/colour/ColourPalettes.json'.asUrl.cachedFetch('SplLibraryItems').then { :answer | answer.text.then { :x | x.postLine } }


system
.caches
.atIfPresent('SplLibraryItems') { :x | x.removeKeyIfAbsent('https://rohandrape.net/sw/hsc3-data/data/colour/ColourGradients.json'.asUrl) { } }

* * *

See also: Cache, CacheStorage, cachedFetch, fetch, fetchMimeType, Url

Categories: Network
