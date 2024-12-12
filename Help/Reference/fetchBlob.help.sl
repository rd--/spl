# fetchBlob

- _fetchBlob(aUrl)_

Answer a `Promise` that will resolve to a `Blob` having the contents of _aUrl_.

~~~
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/png/'
	'smalltalk-balloon.png'
].join('');
url.fetchBlob.thenElse { :aBlob |
	aBlob.type.postLine;
	aBlob.arrayBuffer.then { :anArrayBuffer |
		anArrayBuffer
		.asByteArray
		.base64Encoded
		.postLine
	}
} { :reason |
	reason.postLine
}
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchText, Url

Categories: Network
