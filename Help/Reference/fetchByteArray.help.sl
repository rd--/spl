# fetchByteArray

- _fetchByteArray(aUrl)_

Answer a `Promise` that will resolve to a `ByteArray` having the contents of _aUrl_.

~~~spl async
system
.splUrl('png/Emacs Editor.3.png')
.fetchByteArray
.thenElse { :aByteArray |
	aByteArray
	.base64Encoded
} { :reason |
	reason
}
~~~

* * *

See also: ByteArray, fetch, fetchBlob, fetchJson, fetchMimeType, fetchText, Url

Categories: Network
