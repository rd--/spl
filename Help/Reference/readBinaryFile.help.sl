# readBinaryFile

- _readBinaryFile(path)_

Answer a `ByteArray` holding the contents of the named file.
Signal an `Error` if the file does not exist.

~~~
>>> FilePath('/etc/passwd')
>>> .readBinaryFile
>>> .isByteArray
true
~~~

This uses a different primitive to `fetch` and is synchronous,
however it should answer equivalently:

~~~spl async
'/etc/passwd'
.asFileUrl
.fetchByteArray
.then { :answer |
	answer
	.base64Encode
}
~~~

* * *

See also: fetchByteArray, readTextFile, writeBinaryFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ReadByteArray.html)

Categories: Files
