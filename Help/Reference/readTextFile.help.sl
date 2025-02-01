# readTextFile

- _readTextFile(aPath)_

Answer a `String` holding the contents of the named file.
If the file does not exists signal an `Error`.

~~~
>>> system
>>> .splFile('README.md')
>>> .readTextFile
>>> .lines
>>> .size
16
~~~

This uses a different primitive to `fetch` and is asynchronous,
however it should answer equivalently:

~~~spl async
system
.splFile('README.md')
.asFileUrl
.fetchText
~~~

* * *

See also: fetchText, readBinaryFile, writeTextFile

Guides: File Functions

Categories: Files, System
