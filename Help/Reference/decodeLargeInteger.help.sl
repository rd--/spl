# decodeLargeInteger

- _decodeLargeInteger(b, e=⊤)_

Decode litte-endian binary data at the `ByteArray` _b_ as a `LargeInteger`,
in _little endian_ format if the _e_ is `true`.

```
>>> ByteArray[1 0 0 0]
>>> .decodeLargeInteger(true)
1L

>>> ByteArray[0 0 0 1]
>>> .decodeLargeInteger(false)
1L

>>> ByteArray[0 0 0 1]
>>> .decodeLargeInteger(true)
16777216L

>>> ByteArray[1 0 0 0]
>>> .decodeLargeInteger(false)
16777216L
```

Show working,
to read digits see `digitAt`:

```
>>> ByteArray[1 3 5 7]
>>> .decodeLargeInteger(true)
1L + (3 << 8) + (5 << 16) + (7 << 24)

>>> let n = 117768961L;
>>> 1:4.collect { :each |
>>> 	n.digitAt(each)
>>> }
[1L 3L 5L 7L]
```

At a thireen-place array:

```
>>> ByteArray[
>>> 	245 124 239 253
>>> 	184 104  49 179
>>> 	174 168   5  89
>>> 	 18
>>> ].decodeLargeInteger(true)
1453657932340170668622419557621L
```

* * *

See also: encode, encodeInt8, encodeInt16, encodeFloat32, encodeFloat64, randomLargeInteger

Guides: Bitwise Functions

Categories: Encoding
