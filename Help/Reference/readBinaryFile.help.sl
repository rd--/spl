# readBinaryFile

- _readBinaryFile(aString | aUrl)_

Answer a `ByteArray` holding the contents of the named file.
Signal an `Error` if the file does not exist.

~~~
let bytes = '/etc/passwd'.readBinaryFile;
bytes.base64Encoded.postLine
~~~

This uses a different primitive to `fetch` and is synchronous,
however it should answer equivalently:

~~~
let url = '/etc/passwd'.asFileUrl;
url.fetchByteArray.thenElse { :answer |
	answer.base64Encoded.postLine
} { :reason |
	reason.postLine
}
~~~

* * *

See also: fetchByteArray, readTextFile, writeBinaryFile

Guides: File Functions

Categories: Files
