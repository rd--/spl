# binarySearchRightmost

- _binarySearchRightmost(aSequence, anObject)_

Answer the index of _anObject_ in _aSequence_,
which is known to be sorted.

```
>>> [1 3 6 10 15 21 28 36 45 55 57]
>>> .binarySearchRightmost(28)
7
```

If the item is not in the sequence
answer the index of the first item in the sequence that is greater than _anObject_:

```
>>> [1 3 6 10 15 21 28 36 45 55 57]
>>> .binarySearchRightmost(13)
5
```

Finds the last index if the sequence contains multiple copies:

```
>>> [1 2 2 2 2 2 3]
>>> .binarySearchRightmost(2)
6
```

Answers `one` if the item is to the left of the first item,
and answers the `size` of the sequence plus `one` if the item is past the end:

```
>>> let l = [3 5 7 9 11];
>>> [1 6 7 8 13].collect { :each |
>>> 	l.binarySearchRightmost(each)
>>> }
[1 3 3 4 6]
```

In each case,
the index answered is a valid insertion point for `addBeforeIndex`,
such that inserting the searched for item maintains sortedness.

* * *

See also: binaryDetectIndex, binarySearch, binarySearchLeftmost, detectIndex, indexOf
