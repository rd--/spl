# binarySearchLeftmost

- _binarySearchLeftmost(aSequence, anObject)_

Answer the index of _anObject_ in _aSequence_,
which is known to be sorted.

Find an integer in a sorted list of integers:

```
>>> [1 3 6 10 15 21 28 36 45 55]
>>> .binarySearchLeftmost(28)
7
```

If the item is not present answer the _rank_ of the item in the sequence,
which tells the number of elements in the sequence that are less than the item,
and is also the insertion point for the item using `addAfterIndex`:

```
>>> let l = [1 3 6 10 15 21 28 36 45 55];
>>> let n = l.size;
>>> (
>>> 	l.binarySearch(13),
>>> 	l.binarySearchLeftmost(13),
>>> 	l.binarySearchRightmost(13)
>>> )
(0, 4, 5)
```

Finds the first index if the sequence contains multiple copies:

```
>>> let l = [1 2 2 2 2 2 3];
>>> (
>>> 	l.binarySearchLeftmost(2),
>>> 	l.binarySearchRightmost(2)
>>> )
(2, 6)
```

Answers `zero` if the item is to the left of the first item,
and answers the `size` of the sequence if the item is past the end:

```
>>> let l = [3 5 7 9 11];
>>> [1 6 7 8 13].collect { :each |
>>> 	l.binarySearchLeftmost(each)
>>> }
[0 2 3 3 5]
```

In each case,
the index answered is a valid insertion point for `addAfterIndex`,
such that inserting the searched for item maintains sortedness.

Assign values to ranges,
distinguishes out of range values at left but not right:

```
>>> let l = [0 2.5 5 7.5 10];
>>> -1:11.collect { :each |
>>> 	l.binarySearchLeftmost(each)
>>> }
[0 1 1 1 2 2 3 3 3 4 4 5 5]
```

* * *

See also: binaryDetectIndex, binarySearch, binarySearchRightmost, detectIndex, indexForInserting, indexOf
