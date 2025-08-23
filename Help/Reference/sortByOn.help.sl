# sortByOn

- _sortByOn([x₁ x₂ …], compare:/2, key:/1)_

Sort the sequence _x_ in place using the block _compare_ to compare items according to the block _key_.
Answers _x_.

Sort into descending order according to last item:

```
>>> let a = [2 3 1; 2 2 2; 2 1 3];
>>> let b = a.sortByOn(>, last:/1);
>>> (a == b, a)
(true, [2 1 3; 2 2 2; 2 3 1])
```

Sort into ascending order according to the `second` item:

```
>>> let a = [2 3 1; 2 2 2; 2 1 3];
>>> let b = a.sortByOn(<, second:/1);
>>> (a == b, a)
(true, [2 1 3; 2 2 2; 2 3 1])
```

* * *

See also: <, <=, sort, sortBy, sorted, sortOn

Guides: Sort Functions

Categories: Sorting
