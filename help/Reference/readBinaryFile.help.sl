# readBinaryFile

- _readBinaryFile(aString | aUrl)_

Answer a `Promise` that will either resolve to a `ByteArray` holding the contents of the named file,
or reject with an `Error` value.

~~~
'/etc/passwd'.readBinaryFile.thenElse { :aByteArray |
	aByteArray.base64Encoded.postLine
} { :reason |
	reason.postLine
}
~~~

This may use a different primitive to `fetch`, however it should answer equivalently:

~~~
'/etc/passwd'.asFileUrl.fetchByteArray.thenElse { :answer |
	answer.base64Encoded.postLine
} { :reason |
	reason.postLine
}
~~~

* * *

See also: fetchByteArray, Promise, readTextFile, writeBinaryFile

Guides: File System Functions

Categories: Files
