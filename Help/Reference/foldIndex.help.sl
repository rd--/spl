# foldIndex

- _foldIndex(i, n)_

Fold the integer _i_ between one and _n_,
i.e. for one-based indexing:

```
>>> (-2 .. 7).collect { :each |
>>> 	each.foldIndex(5)
>>> }
[4 3 2 1 2 3 4 5 4 3]

>>> (-2 .. 7).collect { :each |
>>> 	each.fold(1, 5)
>>> }
[4 3 2 1 2 3 4 5 4 3]
```

* * *

See also: atFold, atWrap, fold, wrapIndex

Categories: Indexing
