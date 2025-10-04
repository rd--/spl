# readTextFile

- _readTextFile(s)_

Answer a `String` holding the contents of the file named at the string _s_.
If the file does not exists signal an `Error`.

~~~
>>> system
>>> .splFileName('README.md')
>>> .readTextFile
>>> .lines
>>> .size
16
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

Categories: Files, System
