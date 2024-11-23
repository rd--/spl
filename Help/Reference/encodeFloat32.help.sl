# encodeFloat32

- _encodeFloat32(aSmallFloat, littleEndian)_

Answer a `ByteArray` that holds the 32-bit encoding of _aSmallFloat_,
in _littleEndian_ format if the flag is `true`.

```
>>> 1.encodeFloat32(true)
[0, 0, 128, 63].asByteArray

>>> 1.encodeFloat32(false)
[63, 128, 0, 0].asByteArray
```

* * *

See also: encodeInt8, encodeInt16, encodeInt32
