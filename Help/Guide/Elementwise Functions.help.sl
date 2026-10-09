# Elementwise Functions

There are two main kinds of elementwise,
or pointwise or componentwise,
functions.

Unary functions map an operator over a collection,
and are applicable to any `Collection`:

```
>>> [1 4 9 16 25].sqrt
[1 2 3 4 5]

>>> (x: 1, y: 9, z: 25).sqrt
(x: 1, y: 3, z: 5)
```

Binary functions map an operator over two collections that are in some way commesurate,
and are applicable to `Sequence` values:

```
>>> [1 2 3 4 5] ^ [2 3 4 5 6]
[1 8 81 1024 15625]

>>> 1:5 ^ 2:6
[1 8 81 1024 15625]
```

The `Adapt To Protocol` implements elementwise operations between disparate types:

```
>>> [1 2 3 4 5] ^ 6
[1 64 729 4096 15625]

>>> 2 ^ 1:7
[2 4 8 16 32 64 128]
```

* * *

See also: Collection, Sequence, adaptToCollectionAndApply, collect

Guides: Adapt To Protocol, Dictionary Functions, List Functions
