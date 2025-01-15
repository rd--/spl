# Float32Array

- _Float32Array(anInteger)_

Answer an array of _anInteger_ places, each initialized to `zero`,

A `Float32Array` is a `Type` representing an array whose elements are IEEE 32-bit floating point values.
Unlike `List`, a `Float32Array` is of fixed size.

```
>>> let a = Float32Array(5);
>>> a
[0 0 0 0 0].asFloat32Array
```

The `encode` method answers a `ByteArray`,
the boolean parameter indicates if the encoding is in little (`true`) or big (`false`) endian form.

```
>>> [1 2 3 4 5].asFloat32Array.encode(true)
[
	0 0 128 63
	0 0 0 64
	0 0 64 64
	0 0 128 64
	0 0 160 64
].asByteArray
```

* * *

See also: asFloat32Array, ByteArray, List, Float64Array

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#table-49)

Categories: Collection, Type
