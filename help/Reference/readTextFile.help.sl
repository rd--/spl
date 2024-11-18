# readTextFile

- _readTextFile(aPath)_

Answer a `String` holding the contents of the named file.
If the file does not exists signal an `Error`.

~~~
'/etc/passwd'.readTextFile.postLine
~~~

This uses a different primitive to `fetch` and is synchronous,
however it should answer equivalently:

~~~
'/etc/passwd'.asFileUrl.fetchText.thenElse { :answer |
	answer.postLine
} { :reason |
	reason.postLine
}
~~~

* * *

See also: fetchText, readBinaryFile, writeTextFile

Guides: File Functions

Categories: Files, System
