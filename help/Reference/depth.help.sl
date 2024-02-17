# depth

_depth(aCollection | anObject)_

Answer the maximum number of indices needed to specify any part of _aCollection_.
Objects that are not collections have _depth_ of one.

Strings have depth one:

```
>>> 'x'.depth
1
```

Vectors have depth two:

```
>>> [1 2 3].depth
2
```

Matrices have depth three:

```
>>> [1 2; 3 4; 5 6].depth
3
```

Only the deepest part of the expression affects the depth:

```
>>> [[[1]]].depth
4

>>> [[[1], 2]].depth
4
```

At deeply nested List:

```
>>> [1, [2, [3, [4, [5, [6, [7, [8, [9]]]]]]]]].depth
10

>>> [[[[[[[[[1], 2], 3], 4], 5], 6], 7], 8], 9].depth
10
```

At deeply nested Tuple:

```
>>> (1, (2, (3, (4, (5, (6, (7, (8, 9)))))))).depth
9
```

At Tree:

```
>>> [1 [2 [3] 4] 5].asTree.depth
4
```

All numbers have depth one:

```
>>> 12345.depth
1

>>> 3j1.depth
1

>>> 2/3.depth
1

>>> 2.sqrt.depth
1
```

The depth of values is considered when computing the depth of a Record:

```
>>> (x: 1, y: 2, z: 3).depth
2

>>> (x: 1, y: [2 3], z: [4 5; 6 7]).depth
4
```

Depth of a nested Record:

```
>>> (x: (y: (z: 3))).depth
4
```

_depth_ returns a depth one greater than that returned by _rank_:

```
>>> let v = [1 2 3];
>>> (v.depth, v.rank)
(2, 1)
```

* * *

See also: leafCount, rank

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Depth.html)
