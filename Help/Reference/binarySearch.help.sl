# binarySearch

- _binarySearch(aSequence, anObject)_

Answer the index of _anObject_ in _aSequence_, which is known to be sorted.
If _anObject_ is not in _aSequence_ answer `zero`.

Find an integer in a sorted list of integers:

```
>>> [1 3 6 10 15 21 28 36 45 55]
>>> .binarySearch(6)
3
```

Find each item of a sorted sequence in itself:

```
>>> let l = [8 30 35 45 49 77 79 82 87 97];
>>> l.collect { :each |
>>> 	l.binarySearch(each)
>>> }
[1 .. 10]
```

Finds the first index if the sequence contains multiple copies:

```
>>> [1 2 2 2 2 2 3].binarySearch(2)
2
```

To find the rightmost of multiple entries see `binarySearchRightmost`:

```
>>> [1 2 2 2 2 2 3]
>>> .binarySearchRightmost(2)
6
```

Answers `zero` if no item is found:

```
>>> [1 3 5 7 9].binarySearch(4)
0
```

* * *

See also: binaryDetectIndex, binarySearchLeftmost, binarySearchRightmost, detectIndex, indexOf

References:
_Mathematica_
[1](https://mathworld.wolfram.com/BinarySearch.html)
_W_
[1](https://en.wikipedia.org/wiki/Binary_search)
