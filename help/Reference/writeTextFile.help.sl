# writeTextFile

- _writeTextFile(aPath, aString)_

Write _aString_ to the named text file and answer `nil`.
Over-writes any existing file.
Signals an error if the write fails.

~~~
>>> '/tmp/spl.text'.writeTextFile('Sᴘʟ')
nil

>>> '/tmp/spl.text'.readTextFile
'Sᴘʟ'
~~~

* * *

See also: Promise, readTextFile, writeBinaryFile

Guides: File Functions

Categories: Files
