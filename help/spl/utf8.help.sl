# utf8 -- encoding

- _utf8(aString)_
- _utf8(aByteArray)_

Answer a _ByteArray_ of the Utf-8 encoding of _aString_.

Answer a _String_ of _ByteArray_ which must be an Utf-8 encoding.

```
'€'.utf8 = [226, 130, 172].ByteArray
[226, 130, 172].ByteArray.utf8 = '€'
```

* * *

See also: _ascii_
