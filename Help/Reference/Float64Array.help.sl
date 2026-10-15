# Float64Array

- _Float64Array(n, x=0)_
- _Float64Array([x₁ x₂ …])_

A `Float64Array` is an array whose elements are IEEE 64-bit floating point values.
Unlike a `List`, a `Float64Array` is of fixed size.

In the `List` case,
answer a `Float64Array` initialized to _[x, …]_:

```
>>> Float64Array[1 2 3 4 5]
>>> .List
[1 2 3 4 5]
```

Little-endian encodings of small integers:

```
>>> Float64Array[1 3 5 7 9]
>>> .encode(true)
ByteArray[
	  0   0   0   0   0   0 240  63
	  0   0   0   0   0   0   8  64
	  0   0   0   0   0   0  20  64
	  0   0   0   0   0   0  28  64
	  0   0   0   0   0   0  34  64
]
```

Zero `Float64Array` of _n_ places:

```
>>> 5.zeroFloat64Array
Float64Array[0 0 0 0 0]
```

* * *

See also: ByteArray, Float32Array, List, encode

Guides: Vector Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#table-49)

Categories: Collection, Type
