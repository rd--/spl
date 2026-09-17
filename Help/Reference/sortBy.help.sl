# sortBy

- _sortBy([x₁ x₂ …], f:/2)_

Sort the sequence _x_ in place using the boolean comparator block _f_.
Answers _x_.
Unlike `sort`, the comparison block must be valid, not `nil`.

At `List`, sort into descending order:

```
>>> let a = [1 7 3 9 5];
>>> a.sortBy(>=);
>>> a
[9 7 5 3 1]
```

At `List`, sort into ascending order:

```
>>> [1 7 3 9 5].sortBy(<=)
[1 3 5 7 9]
```

At an `Association` list, sort by descending key:

```
>>> [3 -> 'a', 1 -> 'b', 2 -> 'c'].sortBy(|>)
[3 -> 'a', 2 -> 'c', 1 -> 'b']
```

At a matrix:

```
>>> [1 2 3; 4 5 6].sortBy(|>)
[4 5 6; 1 2 3]

>>> ['1' '2' '3'; '4' '5' '6']
>>> .sortBy(|>)
['4' '5' '6'; '1' '2' '3']
```

It is an error to provide a sort block that does not answer a `Boolean` value,
in particular `compare` and related methods:

```
>>> {
>>> 	[1 3 2 4 5].sortBy(compare:/2)
>>> }.hasError
true
```

* * *

See also: sort, sortComparing, sortByOn, sorted, sortOn

Guides: Sort Functions

Categories: Sorting
