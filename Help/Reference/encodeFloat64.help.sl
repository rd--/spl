# encodeFloat64

- _encodeFloat64(n, littleEndian)_

Answer a `ByteArray` that holds the 64-bit IEEE encoding of the small float _n_,
in _littleEndian_ format if the flag is `true`.

Encode small integer:

```
>>> 1.encodeFloat64(true)
ByteArray[0 0 0 0 0 0 240 63]

>>> 1.encodeFloat64(false)
ByteArray[63 240 0 0 0 0 0 0]
```

Encode `pi` and `e`:

```
>>> 1.pi.encodeFloat64(true)
ByteArray[24 45 68 84 251 33 9 64]

>>> 1.e.encodeFloat64(true)
ByteArray[105 87 20 139 10 191 5 64]
```

* * *

See also: encodeInt8, encodeInt16, encodeInt32, encodeFloat32

Guides: Bitwise Functions

Categories: Encoding
