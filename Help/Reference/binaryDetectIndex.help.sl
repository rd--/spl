# binaryDetectIndex

- _binaryDetectIndex(anInteger, aBlock:/1)_

Answer the smallest index _i_ in _1 .. anInteger_ for which _aBlock(i)_ answers `true`,
assuming that _aBlock(i) = true_ implies _aBlock(i + 1) = true_.
If there is no such index answer _anInteger + 1_.
Used to implement `binarySearch`.

```
>>> let l = [1 3 6 10 15 21 28 36 45 55];
>>> l.collect { :n |
>>> 	l.size.binaryDetectIndex { :index |
>>> 		l[index] >= n
>>> 	}
>>> }
[1 .. 10]
```

Search a list sorted in descending order.
The approach is the same as searching a list in ascending order, but with the condition inverted:

```
>>> let l = [55 45 36 28 21 15 10 6 3 1];
>>> l.size.binaryDetectIndex { :i |
>>> 	l[i] <= 6
>>> }
8
```

No such index:

```
>>> let l = [1 3 5 7 9];
>>> l.size.binaryDetectIndex { :i |
>>> 	l[i] >= 11
>>> }
6
```

* * *

See also: binarySearch, detectIndex

References:
_Go_
[1](https://pkg.go.dev/sort#Search)
