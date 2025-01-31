# fetchBlob

- _fetchBlob(aUrl)_

Answer a `Promise` that will resolve to a `Blob` having the contents of _aUrl_.

~~~spl async=String
let url = [
	'https://rohandrape.net/'
	'sw/stsc3/lib/png/'
	'smalltalk-balloon.png'
].join('');
url.fetchBlob.then { :aBlob |
	aBlob.type.postLine;
	aBlob.arrayBuffer.then { :anArrayBuffer |
		anArrayBuffer
		.asByteArray
		.base64Encoded
	}
}
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchText, Url

Categories: Network
