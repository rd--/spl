# sortByOn

- _sortByOn([x₁ x₂ …], f:/2, g:/1)_

Sort the sequence _x_ in place using the binary sort block _f_ to compare items according to the unary key block _g_.
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

Sort association list:

```
>>> ['x' -> 1, 'y' -> 2, 'z' -> 3]
>>> .sortByOn(>, value:/1)
['z' -> 3, 'y' -> 2, 'x' -> 1]
```

* * *

See also: <, <=, sort, sortBy, sorted, sortOn

Guides: Sort Functions

Categories: Sorting
