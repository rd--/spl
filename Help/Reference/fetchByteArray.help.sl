# fetchByteArray

- _fetchByteArray(u)_

Answer a `Promise` that will resolve to a `ByteArray` having the contents of the `Url` _u_.

~~~spl async
system
.splUrl('png/Emacs Editor.3.png')
.fetchByteArray
.thenElse { :aByteArray |
	aByteArray
	.base64Encode
} { :reason |
	reason
}
~~~

* * *

See also: ByteArray, fetch, fetchBinaryLargeObject, fetchJson, fetchMimeType, fetchText, Url

Guides: Network Functions

Categories: Network
