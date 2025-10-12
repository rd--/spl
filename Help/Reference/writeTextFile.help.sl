# writeTextFile

- _writeTextFile(system, path, data)_

Write the string _data_ to a text file at _path_ and answer `nil`.
Over-writes any existing file.
Signals an error if the write fails.

~~~
>>> system.writeTextFile(
>>> 	'/tmp/spl.text',
>>> 	'Sᴘʟ'
>>> )
nil

>>> system.readTextFile('/tmp/spl.text')
'Sᴘʟ'

>>> system.removeFile('/tmp/spl.text')
nil
~~~

* * *

See also: makeDirectory, readTextFile, removeFile, writeBinaryFile

Guides: File Functions

Categories: Files
