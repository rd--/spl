# readDirectoryFileNames

- _readDirectoryFileNames(aString | aUrl)_

Answer a `List` of the files in the specified directory,
or reject with an `Error` value.

The names are given in qualified form, that is with the directory prefix.
Only ordinary files are listed, not sub-directories.

```
>>> 'Help'.splFile.readDirectoryFileNames
['/home/rohan/sw/spl/Help/Index.text']
```

There is also an asynchronous variant that answers a `Promise`,
which will either resolve to a `List` of the files in the specified directory,
or reject with an `Error` value.

~~~
'/etc'.readDirectoryFileNamesAsync.thenElse { :answer |
	answer.postLine
} { :reason |
	reason.postLine
}
~~~

* * *

See also: pathJoin, Promise, readBinaryFile, readDirectory, readTextFile

Guides: File Functions

Categories: Files
