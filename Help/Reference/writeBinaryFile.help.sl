# writeBinaryFile

- _writeBinaryFile(aString | aUrl, aByteArray)_

Write _aByteArray_ to the named file and answer `nil`.
Over-writes any existing file.
Signals an error if the write fails.

```
>>> '/tmp/spl.binary'.writeBinaryFile(1:9.asByteArray)
nil

>>> '/tmp/spl.binary'.readBinaryFile
1:9.asByteArray
```

* * *

See also: makeDirectory, readBinaryFile, writeTextFile

Guides: File Functions

Categories: Files
