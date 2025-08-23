# sorted

- _sorted(aCollection, aBlock:/2)_
- _sorted(α)_ ⟹ _sorted(α, <=)_

Answer a new `List` which contains the same elements as _aCollection_,
where the elements are sorted by _aBlock_.

The block should take two arguments,
and answer `true` if the first element should preceed the second one.

The unary form of `sorted` sorts using `<=`.

```
>>> [1 3 2 4 5].sorted
[1 .. 5]

>>> [1 3 2 4 5].sorted(>)
[5 .. 1]
```

With literal block:

```
>>> [1 3 2 4 5].sorted { :i :j | i > j }
[5 .. 1]
```

Answer is a new `List`, see `sort` for in place variant:

```
>>> let a = [3 2 1];
>>> a.sorted ~~ a
true
```

* * *

See also: ordering, sort, sortBy, sortByOn, sortOn

Guides: Sort Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Sort.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#sorted)

Categories: Sorting
