# readTextFile

- _readTextFile(aString | aUrl)_

Answer a `Promise` that will either resolve to a `String` holding the contents of the named file,
or reject with an `Error` value.

~~~
'/etc/passwd'.readTextFile.thenElse { :answer |
	answer.postLine
} { :reason |
	reason.postLine
}
~~~

This may use a different primitive to `fetch`, however it should answer equivalently:

~~~
'/etc/passwd'.asFileUrl.fetchText.thenElse { :answer |
	answer.postLine
} { :reason |
	reason.postLine
}
~~~

* * *

See also: fetchText, Promise, readBinaryFile, writeTextFile

Guides: File System Functions

Categories: Files
