# Float32Array

- _Float32Array(x)_

A `Float32Array` is a `Type`,
representing an array whose elements are IEEE 32-bit floating point values.
Unlike `List`, a `Float32Array` is of fixed size.

At `Integer`,
answer an array of _n_ places,
each initialized to `zero`:

```
>>> Float32Array(5)
Float32Array[0 0 0 0 0]
```

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

* * *

See also: ByteArray, encode, List, Float64Array

Guides: Vector Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/NumericArray.html),
_Tc39_
[1](https://tc39.es/ecma262/multipage/indexed-collections.html#table-49)

Categories: Collection, Type
