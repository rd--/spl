# arrayDepth

- _arrayDepth(aList)_

Answer the depth to which _aList_ is a full array,
with all the parts at a particular level having the same length.
Unlike `rank`, `arrayDepth` always answers an integer.

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

Works with special array types,
including `SparseArray` and `NumericArray`:

```
>>> [[[0 1]]].asSparseArray(0).arrayDepth
3

>>> [2 3].iota.asNumericArray.depth
3
```

The `arrayDepth` of a scalar value is `zero`:

```
>>> 2.arrayDepth
0
```

At full arrays, `arrayDepth` and `rank` answer the same value:

```
>>> let a = [1 2; 3 4:; 5 6; 7 8];
>>> (a.arrayDepth, a.rank)
(3, 3)
```

Answers the size of `dimensions`:

```
>>> let m = [1 2 3; 4 5 6];
>>> (
>>> 	m.arrayDepth,
>>> 	m.dimensions,
>>> 	m.dimensions.size
>>> )
(2, [2 3], 2)
```

* * *

See also: arrayFlatten, depth, dimensions, isArray, isMatrix, isVector, rank, shape, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayDepth.html)
