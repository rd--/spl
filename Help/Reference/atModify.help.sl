# atModify!

- _atModify!(c, i, f/1, x=nil)_

Replace the element of the collection _c_ at index _i_,
with itself,
or the value _x_ if there is no such index,
transformed by the block _f_.

```
>>> let a = [1 2 3];
>>> let b = a.atModify!(2, square/1, nil);
>>> (a, b)
([1 4 3], 4)
```

* * *

See also: At, Put, at, put

Guides: Indexing Functions, List Functions

Categories: Accessing
