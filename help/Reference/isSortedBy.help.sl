# isSortedBy

- _isSorted(aSequence, aBlock:/2)_

Answer `true` if _aSequence_ is sorted by _aBlock_, else `false`.

At `List`:

```
>>> [11, 9 .. 1].isSortedBy(>)
true
```

With literal sort block:

```
>>> [11, 9 .. 1].isSortedBy { :i :j | i > j }
true
```

At `Tuple`:

```
>>> (11, 9, 7, 5, 3, 1).isSortedBy(>)
true

>>> (11, 9, 7, 5, 3, 1).isSortedBy { :i :j | i > j }
true
```

At `Range`:

```
>>> 9:1.isSortedBy(>)
true

>>> 9:1.isSortedBy { :i :j | i > j }
true
```

* * *

See also: isSorted, sort, sorted

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/issorted.html)

Categories: Testing, Sorting
