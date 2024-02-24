# leafCount

_leafCount(aCollection | aTree)_

Answers the total number of non-collection elements in _aCollection_.

At `Range`:

```
>>> 1:9.leafCount
9
```

At `List`:

```
>>> [1 2 3].leafCount
3

>>> [1, [2, [3, [4, [5]]]]].leafCount
5
```

At `Tuple`:

```
>>> (1, (2, (3, (4, 5)))).leafCount
5
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).leafCount
3

>>> (x: (y: (z: 3))).leafCount
1
```

At `Tree`:

```
>>> [1 [2 [3 4] 5]].asTree.leafCount
5
```

* * *

See also: depth, size, Tree

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LeafCount.html)
