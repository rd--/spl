# writeBinaryFile

- _writeBinaryFile(path, data)_

Write the `ByteArray` _data_ to the named file and answer `nil`.
Over-writes any existing file.
Signals an error if the write fails.

```
>>> FilePath('/tmp/spl.binary')
>>> .writeBinaryFile(
>>> 	1:9.asByteArray
>>> )
nil

>>> FilePath('/tmp/spl.binary')
>>> .readBinaryFile
ByteArray(1:9)
```

* * *

See also: makeDirectory, readBinaryFile, writeTextFile

Guides: File Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BinaryWrite.html)

Categories: Files
