# fetchByteArray

- _fetchByteArray(aUrl)_

Answer a `Promise` that will resolve to a `ByteArray` having the contents of _aUrl_.

~~~
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/png/'
	'smalltalk-balloon.png'
].join('');
url.fetchByteArray.thenElse { :aByteArray |
	aByteArray
	.base64Encoded
	.postLine
} { :reason |
	reason.postLine
}
~~~

* * *

See also: ByteArray, fetch, fetchBlob, fetchJson, fetchMimeType, fetchText, Url

Categories: Network
