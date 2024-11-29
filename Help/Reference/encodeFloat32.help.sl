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

Encode `pi` and `e`:

```
>>> pi.encodeFloat32(true)
[219 15 73 64].asByteArray

>>> e.encodeFloat32(true)
[84 248 45 64].asByteArray
```

* * *

See also: encode, encodeInt8, encodeInt16, encodeInt32, encodeFloat64

Categories: Encoding
