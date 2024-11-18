# writeTextFile

- _writeTextFile(aPath, aString)_

Write _aString_ to a text file at _aPath_ and answer `nil`.
Over-writes any existing file.
Signals an error if the write fails.

~~~
>>> '/tmp/spl.text'.writeTextFile('Sᴘʟ')
nil

>>> '/tmp/spl.text'.readTextFile
'Sᴘʟ'

>>> '/tmp/spl.text'.removeFile
nil
~~~

* * *

See also: makeDirectory, readTextFile, removeFile, writeBinaryFile

Guides: File Functions

Categories: Files
