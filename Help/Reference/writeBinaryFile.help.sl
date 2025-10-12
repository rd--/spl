# writeBinaryFile

- _writeBinaryFile(system, path, data)_

Write the `ByteArray` _data_ to the named file and answer `nil`.
Over-writes any existing file.
Signals an error if the write fails.

```
>>> system.writeBinaryFile(
>>> 	'/tmp/spl.binary',
>>> 	1:9.asByteArray
>>> )
nil

>>> system.readBinaryFile(
>>> 	'/tmp/spl.binary'
>>> )
1:9.asByteArray
```

* * *

See also: makeDirectory, readBinaryFile, writeTextFile

Guides: File Functions

Categories: Files
