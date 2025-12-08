# heightList

- _heightList(w)_

Answer the height list for the Dyck word _w_.

At `DyckWord`:

```
>>> DyckWord([1 0]).heightList
[0 1 0]

>>> DyckWord([1 1 0 0]).heightList
[0 1 2 1 0]

>>> DyckWord([1 0 1 0]).heightList
[0 1 0 1 0]

>>> DyckWord([1 1 0 0 1 1 1 0 0 0])
>>> .heightList
[0 1 2 1 0 1 2 3 2 1 0]
```

At `List`:

```
>>> [1 1 0 1 0 0].heightList
[0 1 2 1 2 1 0]

>>> [1 1 0 0 1 0].heightList
[0 1 2 1 0 1 0]
```

* * *

See also: DyckWord

Guides: Combinatorial Functions

References:
_Sage_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/dyck_word.html#sage.combinat.dyck_word.DyckWord.heights)
