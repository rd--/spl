# size

- _size(c)_

Answer the number of elements in the collection _c_.
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

>>> (:).size
0
```

Size of a `Map`:

```
>>> [1: 'x', 2: 'y'].size
2

>>> [:].size
0
```

Size of a `String`:

```
>>> 'text'.size
4

>>> ''.size
0
```

Size of a `Bag` is the total number of items:

```
>>> Bag([|'x' -> 1, 'y' -> 2, 'z' -> 3|])
>>> .size
6
```

Find the number of rows in a matrix:

```
>>> [1 2 3; 4 5 6].size
2
```

Find the length of each sublist:

```
>>> [1 2; 4 5 6; 7].collect(size:/1)
[2 3 1]
```

Find the number of digits in 1000!:

```
>>> 1000L.factorial.asString.size - 1
2568
```

`size` gives the maximum index that can be used in a `Sequence`:

```
>>> 1:5.size
5

>>> 1:5.at(5)
5
```

At `Tree` size is the number of sub-trees, see also `leafCount`:

```
>>> [1, [2, 3, 4], 5]
>>> .expressionTree(nil)
>>> .size
3
```

At `Stream` answers the number of elements altogether,
not the number of elements remaining:

```
>>> let s = [1 3 5 7 9].asStream;
>>> (s.next(3), s.size)
([1 3 5], 5)
```

* * *

See also: at, atPut, depth, dimensions, do, indices, isEmpty, leafCount

Guides: Dictionary Functions, List Functions, Stream Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Tally),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/number),
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Length.html)
[1](https://reference.wolfram.com/language/ref/StringLength.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#len)
_Smalltalk_
5.7.1.23

Categories: Accessing
