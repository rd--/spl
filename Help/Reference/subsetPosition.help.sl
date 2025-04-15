# subsetPosition

- _subsetPosition(list, sublist)_

Answer a list of the starting and ending positions at which _sublist_ appears in _list_.

Find the positions of a sublist in a list:

```
>>> [1 2 3 4 1 3].subsetPosition([1 3])
[1 3; 1 6; 5 3; 5 6]

>>> [1 2 3 4 1 3].subsetPosition([1 3 4])
[1 3 4; 1 6 4; 5 3 4; 5 6 4]
```

* * *

See also: mixedRadixEncode, sequencePosition

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SubsetPosition.html)
