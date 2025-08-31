# atAllSymmetrical

- _atAllSymmetrical(c, i)_

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

* * *

See also: atAll, atSymmetrical, part

Guides: Indexing Functions
