# SortedSet

- _SortedSet([x₁ x₂ …])_

`SortedSet` is a `Type` representing a set ordered according to `precedesOrEqualTo`,
where the comparison operator is `=`.

The empty set constructor,
also a `SortedSet` from an empty list:

```
>>> SortedSet().size
0

>>> SortedSet([]).size
0
```

Set predicates:

```
>>> SortedSet().isSortedSet
true

>>> SortedSet().isSet
true
```

Use `add` to insert non-existing items:

```
>>> let c = SortedSet([1 3 5]);
>>> c.add(2);
>>> c.add(4);
>>> c
SortedSet([1 2 3 4 5])
```

Use `include` to insert possibly existing items,
use `remove` to remove items:

```
>>> let c = SortedSet([1 3 5]);
>>> c.include(2);
>>> c.include(5);
>>> c.remove(5);
>>> c
SortedSet([1 2 3])
```

Generate _n_ positive integers less than _m_ and construct a sorted set:

```
>>> let m = 1000;
>>> let n = 3000;
>>> SortedSet(
>>> 	Sfc32(325671)
>>> 	.randomInteger([1 m], [n])
>>> ).size
944
```

Sorted sets are collections:

```
>>> SortedSet([3 2 1])
>>> .collect(square:/1)
SortedSet([1 4 9])

>>> SortedSet([3 2 1]).square
SortedSet([1 4 9])
```

Sorted sets have the expected mathematical behavior in relation to scalars:

```
>>> SortedSet([3 2 1]) * 5
SortedSet([5 10 15])

>>> 15 / SortedSet([3 2 1])
SortedSet([5 15/2 15])
```

A sorted set of strings:

```
>>> ['list' 'kind' 'words' 'of' 'a' 'kind']
>>> .SortedSet
>>> .asList
['a' 'kind' 'list' 'of' 'words']
```

* * *

See also: IdentitySet, Set, SortedList

Guides: Set Functions, Set Syntax
