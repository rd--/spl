# indexOfSubCollection

- _indexOfSubCollection(aCollection, aSubCollection)_

Answer the index of the first element of _aCollection_, where that element equals the first element of _aSubCollection_,
and the next elements equal the rest of the elements of _aSubCollection_.

```
>>> (1, 3 .. 9).indexOfSubCollection([5 7 9])
3

>>> 1:9.indexOfSubCollection([9])
9
```

If no such match is found, answer 0:

```
>>> 1:9.indexOfSubCollection(3:11)
0
```

* * *

See also: indexOf, indexOfSubCollectionStartingAt

Categories: Accessing
