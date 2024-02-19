# isSortedBy

_isSorted(aSequence, aBlock:/2)_

Return true if _aSequence_ is sorted by _aBlock_.

At List:

```
>>> [11, 9 .. 1].isSortedBy { :i :j | i > j }
true
```

At Tuple:

```
>>> (11, 9, 7, 5, 3, 1).isSortedBy { :i :j | i > j }
true
```

At Range:

```
>>> 9:1.isSortedBy { :i :j | i > j }
true
```

* * *

See also: isSorted, sort, sorted

Categories: Sorting
