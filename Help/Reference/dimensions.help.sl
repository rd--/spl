# dimensions

- _dimensions(aCollection, anInteger=Infinity)_

Answer the list of the dimensions of _anObject_ down to level _anInteger_.

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
>>> [[[[1, 2]]]].dimensions
[1 1 1 2]
```

Answer dimensions only down to level two:

```
>>> [[[[1, 2]]]].dimensions(2)
[1 1]
```

Works with special array types, including `SparseArray` objects:

```
>>> [[[1, 2]]].asSparseArray(0).dimensions
[1 1 2]
```

`dimensions` always returns a list:

```
>>> [1 2].dimensions
[2]

>>> [[1, 2]].dimensions
[1 2]
```

The `size` of `dimensions` equals `arrayDepth`:

```
>>> let m = [1 2; 3 4];
>>> (m.dimensions.size, m.arrayDepth)
(2, 2)
```

* * *

See also: arrayDepth, deepIndices, shape

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Dimensions.html)
