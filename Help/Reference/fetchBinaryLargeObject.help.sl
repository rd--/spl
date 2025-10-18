# fetchBinaryLargeObject

- _fetchBinaryLargeObject(aUrl)_

Answer a `Promise` that will resolve to a `BinaryLargeObject` having the contents of _aUrl_.

~~~spl async
system
.splUrl('png/Emacs Editor.3.png')
.fetchBinaryLargeObject
.then { :aBinaryLargeObject |
	aBinaryLargeObject
	.arrayBuffer
	.then { :anArrayBuffer |
		anArrayBuffer
		.asByteArray
		.base64Encode
	}
}
~~~

* * *

See also: fetch, fetchByteArray, fetchJson, fetchText, Url

Categories: Network
