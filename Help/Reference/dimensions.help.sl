# dimensions

- _dimensions(anObject, anInteger=Infinity)_

Answer the list of the dimensions of _anObject_ down to level _anInteger_.

Find the dimensions of a vector:

```
>>> [1 2 3 4 5].dimensions
[5]
```

At the empty `List`:

```
>>> [].dimensions
[0]
```

Find the dimensions of a matrix:

```
>>> [1 2 3; 4 5 6].dimensions
[2 3]
```

Count only dimensions at which an expression is not _ragged_:

```
>>> [1 2 3; 4 5; 6].dimensions
[3]
```

Works with arrays of any depth:

```
>>> [1 2; 3 4:; 5 6; 7 8]
>>> .dimensions
[2 2 2]

>>> [[[[1, 2]]]].dimensions
[1 1 1 2]
```

Answer dimensions only down to,
at most,
level two:

```
>>> [[[[1, 2]]]].dimensions(2)
[1 1]

>>> [1 2 3 4 5].dimensions(2)
[5]

>>> let x = [1 2; 3 4:; 5 6; 7 8];
>>> (x.dimensions, x.dimensions(2))
([2 2 2], [2 2])
```

Works with special array types, including `SparseArray` objects:

```
>>> [[[1, 2]]].asSparseArray(0).dimensions
[1 1 2]
```

`dimensions` always returns a list,
at scalar values answers the empty list:

```
>>> 2.dimensions
[]

>>> [1 2].dimensions
[2]

>>> [[1, 2]].dimensions
[1 2]

>>> [[[3]]].dimensions(0)
[]
```

The `size` of `dimensions` equals `arrayDepth`:

```
>>> let m = [1 2; 3 4];
>>> (m.dimensions.size, m.arrayDepth)
(2, 2)
```

At full arrays, `dimensions` and `shape` answer the same value:

```
>>> let a = [1 2; 3 4:; 5 6; 7 8];
>>> (a.dimensions, a.shape)
([2 2 2], [2 2 2])
```

At `Range`:

```
>>> 1:9.dimensions
[9]

>>> [1 2 3 4 5 6 7 8 9].dimensions
[9]
```

* * *

See also: arrayDepth, deepIndices, depth, rank, shape

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Dimensions.html)
