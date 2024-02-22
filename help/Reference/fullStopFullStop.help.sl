# ..

.. is a syntax token, it is not an operator.

It forms a part of [Range Syntax].

The notation _(from .. to)_ create a _Range_ from _from_ to _to_.

```
>>> (1 .. 9)
Range(1, 9, 1)

>>> (1, 3 .. 9)
Range(1, 9, 2)
```

The notation _[from .. to]_ creates a _List_ with elements from _from_ to _to_.

```
>>> [1 .. 9]
[1, 2, 3, 4, 5, 6, 7, 8, 9]

>>> [1, 3 .. 9]
[1, 3, 5, 7, 9]
```

* * *

See also: Range Syntax

Categories: Syntax
