# atModify

- _atModify(c, i, f:/1)_

Replace the element of the collection _c_ at index _i_ with itself transformed by the block _f_.

```
>>> let l = [1 2 3];
>>> l.atModify(2, nil, square:/1) = 4 & { l = [1 4 3] }
true
```

* * *

See also: at, atPut

Categories: Accessing
