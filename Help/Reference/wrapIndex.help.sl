# wrapIndex

- _wrapIndex(anInteger, size)_

Wrap _anInteger_ between one and _size_, ie. for one-based indexing:

```
>>> (-2 .. 7).collect { :each |
>>> 	each.wrapIndex(5)
>>> }
[3 4 5 1 2 3 4 5 1 2]

>>> (-2 .. 7).collect { :each |
>>> 	each.wrapBetweenAnd(1, 5 + 1)
>>> }
[3 4 5 1 2 3 4 5 1 2]
```

* * *

See also: foldIndex, wrapBetweenAnd

Categories: Indexing
