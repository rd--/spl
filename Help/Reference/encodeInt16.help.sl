# encodeInt16

- _encodeInt16(n, littleEndian)_

Answer a `ByteArray` that holds the 16-bit encoding of the integer _n_,
in _littleEndian_ format if the flag is `true`.

```
>>> 1.encodeInt16(true)
ByteArray([1 0])

>>> 1.encodeInt16(false)
ByteArray([0 1])
```

* * *

See also: encode, encodeInt8, encodeInt32, encodeFloat32, encodeFloat64

Guides: Bitwise Functions

Categories: Encoding
