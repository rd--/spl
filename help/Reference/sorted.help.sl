# sorted

- _sorted(aCollection, aBlock:/2)_
- _sorted(aCollection)_ ⟹ _sorted(aCollection, <=)_

Answer a new `List` which contains the same elements as _aCollection_ where the elements are sorted by _aBlock_.

The block should take two arguments and answer `true` if the first element should preceed the second one.

The unary form of `sorted` sorts using `<=`.

```
>>> [1, 3, 2, 4, 5].sorted
[1 .. 5]

>>> [1, 3, 2, 4, 5].sorted { :i :j | i > j }
[5 .. 1]

>>> let a = [3, 2, 1];
>>> a.sorted ~= a
true
```

* * *

See also: sort, sortBy

Categories: Sorting
