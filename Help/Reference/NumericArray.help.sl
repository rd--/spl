# NumericArray

- _asNumericArray(aList, storageType='Float64')_
- _asNumericArray(typedVector, shape)_

A `Type` holding an array of numbers.

Construct a `NumericArray` from a `List`:

```
>>> let l = [2 3].iota;
>>> let a = l.asNumericArray;
>>> (
>>> 	a.shape,
>>> 	a.rank,
>>> 	a.elementType,
>>> 	a.storageType,
>>> 	a.normal,
>>> 	a.ravel,
>>> 	a[2, 3]
>>> )
(
	[2 3],
	2,
	'SmallFloat',
	'Float64',
	[1 2 3; 4 5 6],
	[1 2 3 4 5 6],
	6
)
```

The binary form allows specifying the storage type:

```
>>> let l = 32.iota;
>>> let a = l.asNumericArray('Byte');
>>> (
>>> 	a.shape,
>>> 	a.rank,
>>> 	a.storageType,
>>> 	a.elementType
>>> )
([32], 1, 'Byte', 'SmallFloat')
```

Convert a matrix of reals to a numeric array:

```
>>> let l = [5 5].iota;
>>> let a = l.asNumericArray('Float32');
>>> (
>>> 	a.shape,
>>> 	a.rank,
>>> 	a.storageType,
>>> 	a.elementType
>>> )
([5 5], 2, 'Float32', 'SmallFloat')
```

Scalar math at `NumericArray`:

```
>>> let a = [3 3].iota.asNumericArray;
>>> (a ^ 2).normal
[
	 1   4 9;
	16 25 36;
	49 64 81
]
```

Elementwise math at `NumericArray`:

```spl svg=A
let a = [7 23].iota.asNumericArray;
((a * 7).sin - (a * 13).cos).matrixPlot
```

![](sw/spl/Help/Image/NumericArray-A.svg)

* * *

See also: ByteArray, Float32Array, Float64Array, List, SmallFloat, SparseArray

References:
_Mathematica_
[1](https://reference.wolframcloud.com/language/ref/NumericArray.html)
