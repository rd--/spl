# atAllSymmetrical

- _atAllSymmetrical(c, [i₁ i₂ …])_

Answer the items at integer indices _i_ in the sequence _c_.
For negative indices answer the item at the specified number of places from the end.

The first three items have indices _(1, 2, 3)_:

```
>>> [1 3 5 7 9].atAllSymmetrical(1:3)
[1 3 5]
```

The last three items have indices _(-3, -2, -1)_:

```
>>> [1 3 5 7 9].atAllSymmetrical(-3:-1)
[5 7 9]
```

A range to request the last _n_ items in order is written _-n:-1_:

```
>>> -7:-1
Range(-7, -1, 1)

>>> [1, 3 .. 23].atAllSymmetrical(-7:-1)
[11 13 15 17 19 21 23]
```

A range to request the last _n_ items in reverse order is written _-1:-n:-1_:

```
>>> -1:-7:-1
Range(-1, -7, -1)

>>> [1, 3 .. 23].atAllSymmetrical(-1:-7:-1)
[23 21 19 17 15 13 11]
```

* * *

See also: atAll, atSymmetrical, part

Guides: Indexing Functions
