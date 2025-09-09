# readDirectoryFileNames

- _readDirectoryFileNames(p)_

Answer a `List` of the files in the directory specified at _p_,
or reject with an `Error` value.

The names are given in qualified form, that is with the directory prefix.
Only ordinary files are listed, not sub-directories.

```
>>> system
>>> .splFileName('Help')
>>> .readDirectoryFileNames
[
	'/home/rohan/sw/spl/Help/Index.text'
]
```

There is also an asynchronous variant that answers a `Promise`,
which will either resolve to a `List` of the files in the specified directory,
or reject with an `Error` value.

~~~spl async
'/etc'
.readDirectoryFileNamesAsync
~~~

* * *

See also: pathJoin, Promise, readBinaryFile, readDirectory, readTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FileNames.html)

Categories: Files
