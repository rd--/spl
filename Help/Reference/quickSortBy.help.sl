# quickSortBy

- _quickSortBy([x₁ x₂ …], f:/2)_

Sort the sequence _x_ in place using the comparator block _f_.
Answers _x_.

At `List`, sort into descending order:

```
>>> let a = [1 7 3 9 5];
>>> a.quickSortBy(>=);
>>> a
[9, 7 .. 1]
```

At `List`, sort into ascending order:

```
>>> [1 7 3 9 5].quickSortBy(<=)
[1, 3 .. 9]
```

* * *

See also: mergeSortBy, quickSort, sortBy

Guides: Sort Functions

Categories: Sorting
