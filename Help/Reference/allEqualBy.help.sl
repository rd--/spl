# allEqualBy

- _allEqualBy(c, f:/2)_

Answer `true` is all items in the collection _c_ are equal according to the block _f_.

```
>>> [1 1 1].allEqualBy(=)
true

>>> [1 2 3].allEqualBy(=)
false
```

The empty and unary lists answer `true`:

```
>>> [].allEqualBy(=)
true

>>> ['x'].allEqualBy(=)
true
```

Do all items compare equal according to `~`:

```
>>> [0 1E-6 1E-9].allEqualBy(~)
true
```

* * *

See also: =, ~, allEqual
