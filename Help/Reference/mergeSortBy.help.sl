# mergeSortBy

- _mergeSortBy([x₁ x₂ …], f:/2)_

Sort the sequence _x_ in place using the comparator block _f_ using the merge sort algorithm.
Answers _x_.

At `List`, sort into descending order:

```
>>> let a = [1 7 3 9 5];
>>> a.mergeSortBy(>=);
>>> a
[9, 7 .. 1]
```

At `List`, sort into ascending order:

```
>>> [1 7 3 9 5].mergeSortBy(<=)
[1, 3 .. 9]
```

* * *

See also: mergeSort, sort, sortBy, sortByOn, sorted, sortOn

Guides: List Functions, Sort Functions

Categories: Sorting
