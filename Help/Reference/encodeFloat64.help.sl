# encodeFloat64

- _encodeFloat64(aSmallFloat, littleEndian)_

Answer a `ByteArray` that holds the 64-bit IEEE encoding of _aSmallFloat_,
in _littleEndian_ format if the flag is `true`.

Encode small integer:

```
>>> 1.encodeFloat64(true)
[0 0 0 0 0 0 240 63].asByteArray

>>> 1.encodeFloat64(false)
[63 240 0 0 0 0 0 0].asByteArray
```

Encode `pi` and `e`:

```
>>> pi.encodeFloat64(true)
[24 45 68 84 251 33 9 64].asByteArray

>>> e.encodeFloat64(true)
[105 87 20 139 10 191 5 64].asByteArray
```

* * *

See also: encodeInt8, encodeInt16, encodeInt32, encodeFloat32
