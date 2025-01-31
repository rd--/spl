# readBinaryFile

- _readBinaryFile(aString | aUrl)_

Answer a `ByteArray` holding the contents of the named file.
Signal an `Error` if the file does not exist.

~~~
>>> '/etc/passwd'
>>> .readBinaryFile
>>> .isByteArray
true
~~~

This uses a different primitive to `fetch` and is synchronous,
however it should answer equivalently:

~~~spl async=String
let url = '/etc/passwd'.asFileUrl;
url.fetchByteArray.then { :answer |
	answer.base64Encoded
}
~~~

* * *

See also: fetchByteArray, readTextFile, writeBinaryFile

Guides: File Functions

Categories: Files
