# writeTextFile

- _writeTextFile(aString | aUrl, aString)_

Answer a `Promise` that will either resolve to a `nil` value,
or reject with an `Error` value.

~~~
'/tmp/file.text'.writeTextFile('text').then { :unusedNil |
	'Write completed'.postLine
}
~~~

* * *

See also: Promise, readTextFile

Categories: FileSystem, InputOutput
