# toCollect

- _toCollect(i, j, f:/1)_

Equivalent to _i.to(j).collect(f:/1)_.

```
>>> 1.toCollect(9, square:/1)
[1 4 9 16 25 36 49 64 81]
```

Empty range:

```
>>> 3.toCollect(1, sqrt:/1)
[]
```

* * *

See also: collect, to, toDo

Guides: List Functions
