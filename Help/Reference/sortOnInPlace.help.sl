# sortOnInPlace

- _sortOnInPlace([x₁ x₂ …], f/1)_

Sort the elements of the sequence _x_ in the order defined by applying the unary block _f_ to each of them.
Sort is in place (mutating) and answers _x_.

Sort according to `last` item in each sub-list:

```
>>> [1 2 3; 2 3 1; 3 1 2; 2 2]
>>> .sortOnInPlace(last/1)
[2 3 1; 3 1 2; 2 2; 1 2 3]
```

Sort according to `sum` of each sub-list:

```
>>> [1 2 3; 2 3 1; 3 1 2; 2 2]
>>> .sortOnInPlace(sum/1)
[2 2; 1 2 3; 2 3 1; 3 1 2]
```

Sort according to `negate` value of each item:

```
>>> let alpha = [1 2 3 4 5];
>>> let beta = alpha.sortOnInPlace(negate/1);
>>> (alpha, alpha == beta)
([5 4 3 2 1], true)
```

* * *

See also: sort, sortByInPlace, sortByOn

Guides: Sort Functions

Categories: Sorting
