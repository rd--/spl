# isVector

- _isVector(aSequence)_

A `Sequence` is a vector if none of the elements in the sequence has the type of the sequence:

At `List`:

```
>>> [1 2 3 4 5 6].isVector
true

>>> [1 2 3; 4 5 6].isVector
false
```

At `Tuple`:

```
>>> (1, 2, 3, 4, 5, 6).isVector
true

>>> ((1, 2, 3), (4, 5, 6)).isVector
false
```

The elements need not be of the same type:

```
>>> [1 'Two' pi 4n 5j0].isVector
true
```

* * *

See also: elementType, isArray, isList, isMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/VectorQ.html)

Categories: Testing
