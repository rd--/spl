# size

- _size(aCollection)_

Answer the number of elements in _aCollection_.
For indexable collections, this value is the same as the largest legal index.

Size of a `List`:

```
>>> [1, 2, 3, 4, 5].size
5

>>> [1, [2, [3, [4, [5]]]]].size
2

>>> [].size
0
```

Size of a `Tuple`:

```
>>> (1, 2, 3, 4, 5).size
5

>>> (1, (2, (3, (4, 5)))).size
2
```

Size of a `Record`:

```
>>> (x: 1, y: 2, z: 3).size
3

>>> (x: (y: (z: 1))).size
1

>>> ().size
0
```

Size of a `String`:

```
'text'.size
4

>>> ''.size
0
```

Find the number of rows (or columns) in a matrix:

```
>>> [1 2 3; 4 5 6].size
2
```

Find the length of each sublist:

```
>>> [[1, 2], [4, 5, 6], [7]].collect(size:/1)
[2, 3, 1]
```

Find the number of digits in 1000!:

```
>>> 1000n.factorial.asString.size
2568
```

_size_ gives the maximum index that can be used in a List:

```
>>> [1, 2, 3, 4, 5].size
5

>>> [1, 2, 3, 4, 5].at(5)
5
```

At `Tree` size is the number of sub-trees, see also _leafCount_:

```
>>> [1 [2 3 4] 5].asTree.size
3
```

* * *

See also: at, atPut, depth, do, isEmpty, leafCount

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Length.html)

Categories: Accessing
