# cachedFetchMimeType

- _cachedFetchMimeType(aUrl, aMimeType)_

Answer a `Promise` that will resolve to the contents of _aUrl_,
according to the value of _aMimeType_, which should be either:

- 'application/octet-stream'
- 'application/json'
- 'text/plain'

Fetch Utf-8 encoded text:

~~~
let url = [
	'https://rohandrape.net/'
	'sw/spl/README.md'
].join('').asUrl;
let mimeType = 'text/plain';
url.cachedFetchMimeType(
	'*scratch*',
	mimeType
).then { :aString |
	aString.postLine
}
~~~

* * *

See also: Cache, cachedFetch, fetch, Url

Categories: Network
