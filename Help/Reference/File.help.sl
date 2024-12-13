# File

- _File(fileData, fileName, fileOptions)_

A `File` object is a `Blob` object with a `name` attribute, which is a `String`.

In addition to the `Blob` trait, it implements the methods `lastModified` and `name`.

```
>>> let fileData = 1:9.asByteArray;
>>> let fileName = 'x.bin';
>>> let fileOptions = (
>>> 	type: 'application/octet-stream'
>>> );
>>> let file = File(
>>> 	fileData,
>>> 	fileName,
>>> 	fileOptions
>>> );
>>> (file.name, file.size, file.type)
('x.bin', 9, 'application/octet-stream')
```

* * *

See also: Blob

References:
_W3c_
[1](https://w3c.github.io/FileAPI/#file-section)

Categories: System, Type
