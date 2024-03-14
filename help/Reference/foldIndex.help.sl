# foldIndex

- _foldIndex(anInteger, size)_

Fold _anInteger_ between one and _size_, ie. for one-based indexing:

```
>>> -2:7.collect { :each | each.foldIndex(5) }
[4 3 2 1 2 3 4 5 4 3]

>>> -2:7.collect { :each | each.foldBetweenAnd(1, 5) }
[4 3 2 1 2 3 4 5 4 3]
```

* * *

See also: atFold, atWrap, foldBetweenAnd, wrapIndex

Categories: Indexing
