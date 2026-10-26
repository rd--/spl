# sortComparing

- _sortComparing([x₁ x₂ …], f/2)_

Sort the sequence _x_ using the ternary comparator block _f_.
There are both copying and in-place forms.
Answers _x_.

At `List`, sort into ascending order:

```
>>> [1 7 3 9 5]
>>> .sortComparing!(compare/2)
[1 3 5 7 9]
```

At an `Association` list, sort by ascending key:

```
>>> [3 -> 'a', 1 -> 'b', 2 -> 'c']
>>> .sortComparing!(compare/2)
[1 -> 'b', 2 -> 'c', 3 -> 'a']
```

It is an error to provide a comparison block that does not answer a `sign` value,
in particular `<` and related methods:

```
>>> {
>>> 	[1 3 2 4 5].sortComparing!(<)
>>> }.hasError
true
```

* * *

See also: sort, sortBy, sortByOn, sortOn

Guides: Sort Functions

Categories: Sorting
