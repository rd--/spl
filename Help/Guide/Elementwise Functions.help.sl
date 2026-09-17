# Elementwise Functions

There are two main kinds of elementwise,
or pointwise or componentwise,
functions.

Unary functions map an operator over a collection,
and are applicable to any `Collection`:

```
>>> [1 4 9 16 25].sqrt
[1 2 3 4 5]
```

Binary functions map an operator over two collections that are in some way commesurate,
and are applicable to any `Sequencable` collection:

```
>>> [1 2 3 4 5] ^ [2 3 4 5 6]
[1 8 81 1024 15625]
```

* * *

See also: adaptToCollectionAndApply, collect, Collection, Sequence
