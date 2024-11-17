# writeBinaryFile

- _writeBinaryFile(aString | aUrl, aByteArray)_

Answer a `Promise` that will either resolve to a `nil` value,
or reject with an `Error` value.

~~~
'/tmp/spl.binary'.writeBinaryFile(1:9.asByteArray).then { :unused |
	'Write completed'.postLine
}
~~~

* * *

See also: Promise, readBinaryFile, writeTextFile

Guides: File System Functions

Categories: Files
