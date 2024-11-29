# encodeInt16

- _encodeInt16(anInteger, littleEndian)_

Answer a `ByteArray` that holds the 16-bit encoding of _anInteger_,
in _littleEndian_ format if the flag is `true`.

```
>>> 1.encodeInt16(true)
[1, 0].asByteArray

>>> 1.encodeInt16(false)
[0, 1].asByteArray
```

* * *

See also: encode, encodeInt8, encodeInt32, encodeFloat32, encodeFloat64

Categories: Encoding
