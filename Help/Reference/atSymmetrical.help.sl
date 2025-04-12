# atSymmetrical

- _atSymmetrical(c, i)_

Answer the item at integer index _i_ in the sequence _c_.
If _i_ is negative,
answer the item at _i_ places from the end.

The first item has index _1_:

```
>>> [1 3 5 7 9].atSymmetrical(1)
1
```

The last item has index _-1_:

```
>>> [1 3 5 7 9].atSymmetrical(-1)
9
```

The second item has index _2_:

```
>>> [1 3 5 7 9].atSymmetrical(2)
3
```

The second last item has index _-2_:

```
>>> [1 3 5 7 9].atSymmetrical(-2)
7
```

* * *

See also: at, atAllSymmetrical, part
