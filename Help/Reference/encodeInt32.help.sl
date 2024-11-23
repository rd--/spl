# encodeInt32

- _encodeInt32(anInteger, littleEndian)_

Answer a `ByteArray` that holds the 32-bit encoding of _anInteger_,
in _littleEndian_ format if the flag is `true`.

```
>>> 1.encodeInt32(true)
[1, 0, 0, 0].asByteArray

>>> 1.encodeInt32(false)
[0, 0, 0, 1].asByteArray
```

* * *

See also: encodeInt8, encodeInt16, encodeFloat32
