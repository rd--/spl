# Float64Array

- _Float64Array(n)_
- _Float64Array([x, …])_

In the `Integer` case,
answer a `Float64Array` of _n_ places, each initialized to `zero`.

```
>>> Float64Array(5)
Float64Array[0 0 0 0 0]
```

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

A `Float64Array` is an array whose elements are IEEE 64-bit floating point values.
Unlike a `List`, a `Float64Array` is of fixed size.

* * *

See also: ByteArray, encode, List, Float32Array

Guides: Vector Functions

References:
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#table-49)

Categories: Collection, Type
