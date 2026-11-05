# Integer Types

There is only one integer type, `LargeInteger`.

However `SmallFloat` is adopted as a pseudo-type for small integers.

In particular, indexing operations expect `SmallFloat` values,
not `LargeInteger` values.

Primitive mathematical operations that overflow at `SmallFloat` are checked,
and answer `LargeInteger` values:

```
>>> (3 ^ 23).square
8862938119652501095929L

>>> 17 ^ 17
827240261886336764177L
```

Equalities and comparisons:

```
>>> 2L = 2
true

>>> 2 = 2L
true

>>> 3L > 2
true

>>> 3 > 2L
true

>>> 7L % 2
1L

>>> 7 % 2L
1L

>>> 23L.bitXor(47)
56L

>>> 23.bitXor(47L)
56L

>>> 7L / 3
7/3

>>> 7 / 3L
7/3

>>> 3L * 4
12L

>>> 3 * 4L
12L
```
