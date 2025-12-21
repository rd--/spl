# readTextFile

- _readTextFile(path)_

Answer a `String` holding the contents of the file named at the string _path_.
If the file does not exists signal an `Error`.

~~~
>>> 'README.md'
>>> .splFilePath
>>> .readTextFile
>>> .lines
>>> .size
18
~~~

This uses a different primitive to `fetch`,
and is synchronous rather than asynchronous,
however it should answer equivalently:

~~~spl async
system
.splFileName('README.md')
.asFileUrl
.fetchText
~~~

* * *

See also: fetchText, readBinaryFile, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ReadString.html)

Categories: Files, System
