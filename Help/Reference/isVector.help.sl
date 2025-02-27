# isVector

- _isVector(aList)_

A `Sequence` is a vector if none of the elements in the sequence has the type of the sequence.
It is equivalent to asking if the `rank` is `one`.

At `List`:

```
>>> [1 2 3 4 5 6].isVector
true

>>> [1 2 3 4 5 6].rank = 1
true

>>> [1 2 3; 4 5 6].isVector
false
```

A `List` of `Tuple`s is a vector:

```
>>> [(1, 2, 3), (4, 5, 6)].isVector
true
```

The elements need not be of the same type:

```
>>> [1 'Two' 1.pi 4L 5J0].isVector
true
```

* * *

See also: elementType, isArray, isColumnVector, isRowVector, isList, isMatrix, isVectorOf

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/VectorQ.html)

Categories: Testing
