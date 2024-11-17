# readDirectoryFileNames

- _readDirectoryFileNames(aString | aUrl)_

Answer a `Promise` that will either resolve to a `List` of the files in the specified directory,
or reject with an `Error` value.

The names are given in qualified form, that is with the directory prefix.
Only ordinary files are listed, not sub-directories.

~~~
'/etc'.readDirectoryFileNames.thenElse { :answer |
	answer.postLine
} { :reason |
	reason.postLine
}
~~~

* * *

See also: Promise, readBinaryFile, readTextFile

Guides: File System Functions

Categories: Files
