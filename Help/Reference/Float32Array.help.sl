# Float32Array

- _Float32Array(n, x=0)_
- _Float32Array([x₁ x₂ …])_

A `Float32Array` is a `Type`,
representing an array whose elements are IEEE 32-bit floating point values.
Unlike `List`, a `Float32Array` is of fixed size.

At `List`,
answer a `Float32Array` with the values of the list,
which must have element type `SmallFloat`:

```
>>> let l = [1 2 3 4 5];
>>> let a = Float32Array(l);
>>> (
>>> 	l.elementType,
>>> 	a.isFloat32Array,
>>> 	a.size,
>>> 	a.List
>>> )
(
	'SmallFloat',
	true,
	5,
	[1 2 3 4 5]
)
```

At matrices and arrays:

```
>>> Float32Array[1 2 3; 4 5 6]
[Float32Array[1 2 3], Float32Array[4 5 6]]

>>> Float32Array[1 2; 3 4:; 5 6; 7 8]
[
	[Float32Array[1 2], Float32Array[3 4]],
	[Float32Array[5 6], Float32Array[7 8]]
]
```

The `encode` method answers a `ByteArray`,
the boolean parameter indicates if the encoding is in little (`true`) or big (`false`) endian form.

```
>>> Float32Array[1 2 3 4 5]
>>> .encode(true)
ByteArray[
	0 0 128 63
	0 0 0 64
	0 0 64 64
	0 0 128 64
	0 0 160 64
]
```

Zero array of _n_ places:

```
>>> 5.zeroFloat32Array
Float32Array[0 0 0 0 0]
```

* * *

See also: ByteArray, List, Float64Array, encode

Guides: Vector Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumericArray.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#table-49)

Categories: Collection, Type
