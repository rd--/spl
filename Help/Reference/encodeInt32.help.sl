# encodeInt32

- _encodeInt32(n, littleEndian)_

Answer a `ByteArray` that holds the 32-bit encoding of the integer _n_,
in _littleEndian_ format if the flag is `true`.

```
>>> 1.encodeInt32(true)
[1, 0, 0, 0].asByteArray

>>> 1.encodeInt32(false)
[0, 0, 0, 1].asByteArray
```

* * *

See also: encode, encodeInt8, encodeInt16, encodeFloat32, encodeFloat64

Guides: Bitwise Functions

Categories: Encoding
