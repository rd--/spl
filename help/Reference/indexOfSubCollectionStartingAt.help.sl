# indexOfSubCollectionStartingAt

- _indexOfSubCollectionStartingAt(aCollection, aSubCollection, anIndex)_

Answer the index of the first element of _aCollection_, where that element equals the first element of _aSubCollection_,
and the next elements equal the rest of the elements of _aSubCollection_.
Begin the search at element _anIndex_ of _aCollection_.

```
>>> (1, 3 .. 9).indexOfSubCollectionStartingAt([5 7 9], 3)
3

>>> 1:9.indexOfSubCollectionStartingAt([9], 9)
9
```

If no such match is found, answer 0.

```
>>> 1:9.indexOfSubCollectionStartingAt(3:5, 4)
0
```

* * *

See also: indexOf, indexOfSubCollection

References:
_Smalltalk_
5.7.8.22

Categories: Accessing
