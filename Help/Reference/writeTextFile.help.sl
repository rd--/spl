# writeTextFile

- _writeTextFile(path, data)_

Write the string _data_ to a text file at _path_ and answer `nil`.
Over-writes any existing file.
Signals an error if the write fails.

~~~
>>> FilePath('/tmp/spl.text')
>>> .writeTextFile('Sᴘʟ')
nil

>>> FilePath('/tmp/spl.text')
>>> .readTextFile
'Sᴘʟ'

>>> FilePath('/tmp/spl.text')
>>> .removeFile
nil
~~~

* * *

See also: makeDirectory, readTextFile, removeFile, writeBinaryFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/WriteString.html)

Categories: Files
