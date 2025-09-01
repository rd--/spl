# atPathPut

- _atPathPut(c, i, x)_

Store the object _x_ at index _i_ in the collection _c_.
If _i_ is not a valid path (or cartesian) index of _c_ it is an `error`.
Answer _x_.

```
>>> let c = [3 3].iota;
>>> let x = c.atPathPut([2 2], -5);
>>> (x, c)
(-5, [1 2 3; 4 -5 6; 7 8 9])
```

* * *

See also: at, atAllPut, atPath, atPut

Guides: Dictionary Functions, Indexing Functions, List Functions
