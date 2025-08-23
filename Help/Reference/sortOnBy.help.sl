# sortOnBy

- _sortOnBy([x₁ x₂ …], keyBlock:/1, compareBlock:/2)_

Sort the sequence _x_ in place using _compareBlock_ to compare items according to _keyBlock_.
Answers _x.

Sort into descending order according to last item:

```
>>> let a = [2 3 1; 2 2 2; 2 1 3];
>>> let b = a.sortOnBy(last:/1, >);
>>> (a == b, a)
(true, [2 1 3; 2 2 2; 2 3 1])
```

Sort into ascending order according to the `second` item:

```
>>> let a = [2 3 1; 2 2 2; 2 1 3];
>>> let b = a.sortOnBy(second:/1, <);
>>> (a == b, a)
(true, [2 1 3; 2 2 2; 2 3 1])
```

* * *

See also: <, <=, sort, sortBy, sorted, sortOn

Guides: Sort Functions

Categories: Sorting
