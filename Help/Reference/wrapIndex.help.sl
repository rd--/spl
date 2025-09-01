# wrapIndex

- _wrapIndex(i, n)_

Wrap the integer index _i_ between one and _n_, ie. for one-based indexing:

```
>>> (-2 .. 7).collect { :each |
>>> 	each.wrapIndex(5)
>>> }
[3 4 5 1 2 3 4 5 1 2]
```

Threads elementwise over lists:

```
>>> [-2 .. 7].wrapIndex(5)
[3 4 5 1 2 3 4 5 1 2]
```

Equivalent to `wrapExclusive` between `one` and _n+1_:

```
>>> [-2 .. 7].wrapExclusive(1, 5 + 1)
[3 4 5 1 2 3 4 5 1 2]
```

Equivalent to `mod` of `n` and `one`:

```
>>> [-2 .. 7].mod(5, 1)
[3 4 5 1 2 3 4 5 1 2]
```

* * *

See also: foldIndex, wrap, wrapExclusive

Guides: Indexing Functions

Categories: Indexing
