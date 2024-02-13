# leafCount

_leafCount(aCollection)_

Answers the total number of non-collection elements in _aCollection_.

```
>>> [1 2 3].leafCount
3

>>> 1:9.leafCount
9

>>> [1, [2, [3, [4, [5]]]]].leafCount
5

>>> (1, (2, (3, (4, 5)))).leafCount
5

>>> (x: 1, y: 2, z: 3).leafCount
3

>>> (x: (y: (z: 3))).leafCount
1
```

* * *

See also: depth, size

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LeafCount.html)
