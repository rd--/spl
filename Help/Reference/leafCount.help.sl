# leafCount

- _leafCount(aCollection | aTree)_

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

At `Record`:

```
>>> (x: 1, y: 2, z: 3).leafCount
3

>>> (x: (y: (z: 3))).leafCount
1
```

At `Tree`:

```
>>> [1, [2, [3, 4], 5]]
>>> .expressionTree(nil)
>>> .leafCount
5
```

The `leafCount` of a regular array is the product of its `shape`:

```
>>> [7].iota.leafCount
7

>>> [5 7].iota.leafCount
5 * 7

>>> [3 5 7].iota.leafCount
3 * 5 * 7
```

* * *

See also: isAtom, depth, size, Tree

Guides: Tree Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LeafCount.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/double.numel.html)
