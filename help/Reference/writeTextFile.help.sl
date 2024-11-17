# writeTextFile

- _writeTextFile(aString | aUrl, aString)_

Write _aString_ to the named file.
Answer a `Promise` that will either resolve to a `nil` value,
or reject with an `Error` value.

~~~
'/tmp/spl.text'.writeTextFile('Sᴘʟ').then { :unused |
	'Write completed'.postLine
}
~~~

* * *

See also: Promise, readTextFile, writeBinaryFile

Guides: File System Functions

Categories: Files
