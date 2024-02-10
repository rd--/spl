# isVector

_isVector(aSequence)_

A Sequence is a vector if none of the elements in the sequence has the type of the sequence:

At List:

```
>>> [1 2 3 4 5 6].isVector
true

>>> [1 2 3; 4 5 6].isVector
false
```

At Tuple:

```
>>> (1, 2, 3, 4, 5, 6).isVector
true

>>> ((1, 2, 3), (4, 5, 6)).isVector
false
```

* * *

See also: isList, isMatrix

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/VectorQ.html)
