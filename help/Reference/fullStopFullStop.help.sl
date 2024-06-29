# ..

.. is a syntax token, it is not an operator.

It forms a part of `Range Syntax`.

The notation _(from .. to)_ create a `Range` from _from_ to _to_ using `upOrDownTo`:

```
>>> (1 .. 9)
Range(1, 9, 1)
```

Threads over lists:

```
>>> ([1 3 5] .. [5 6 7 8])
[1:5, 3:6, 5:7, 1:8]
```

The notation _(from, then .. to)_ create a `Range` from _from_ to _to_ with step size _then - from_.

```
>>> (1, 3 .. 9)
Range(1, 9, 2)
```

The notation _[from .. to]_ creates a `List` with elements from _from_ to _to_.

```
>>> [1 .. 9]
[1 2 3 4 5 6 7 8 9]

>>> [1, 3 .. 9]
[1 3 5 7 9]
```

* * *

See also: :, --, Interval

Guides: Range Syntax

Categories: Syntax
