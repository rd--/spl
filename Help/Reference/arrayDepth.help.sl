# arrayDepth

- _arrayDepth(aCollection)_

Answer the depth to which _aCollection_ is a full array,
with all the parts at a particular level having the same length.

Find the depth to which an array is full:

```
>>> [1 2; 3 4].arrayDepth
2
```

Counts only dimensions at which an object is not _ragged_:

```
>>> [1 2; 3].arrayDepth
1
```

Works with special array types, including `SparseArray`:

```
>>> [[[1, 2]]].asSparseArray(0).arrayDepth
3
```

* * *

See also: arrayFlatten, depth, dimensions, isArray, isMatrix, isVector, rank, shape, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayDepth.html)
