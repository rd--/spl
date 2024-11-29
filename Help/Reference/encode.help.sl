# encode

- _encode(aTypedArray, littleEndian)_

`Float32Array` encoding of `pi` and `e`:

```
>>> [pi e].asFloat32Array.encode(true)
[
	219  15  73  64
	 84 248  45  64
].asByteArray
```

`Float64Array` encoding of `pi` and `e`:

```
>>> [pi e].asFloat64Array.encode(true)
[
	 24  45  68  84 251  33   9  64
	105  87  20 139  10 191   5  64
].asByteArray
```

* * *

See also: encodeInt8, encodeInt16, encodeInt32, encodeFloat32, encodeFloat64

Categories: Encoding
