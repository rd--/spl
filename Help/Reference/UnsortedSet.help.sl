# UnsortedSet

- _UnsortedSet([x₁ x₂ …])_

`UnsortedSet` is a `Type` representing a set where the comparison operator is `=`.

The empty set constructor,
also an `UnsortedSet` from an empty list:

```
>>> UnsortedSet().size
0

>>> UnsortedSet([]).size
0
```

Set predicate:

```
>>> UnsortedSet().isUnsortedSet
true

>>> UnsortedSet().isSet
true
```

Sets are unordered collections,
and have the expected mathematical behavior in relation to scalars:

```
>>> UnsortedSet([1 2 3]) * 5
UnsortedSet([5 10 15])
```

Note that `UnsortedSet` may be significantly less efficient that `IdentitySet`,
however `==` has some subtle behaviours:

```
>>> 1/1 == 1/1
false

>>> 1 == 1L
false

>>> UnsortedSet([1 1L])
>>> .contents
[1]

>>> {
>>> 	IdentitySet([1 1L])
>>> }.hasError
true

>>> 1J1 == 1J1
false

>>> 1J1 = 1J1
true

>>> UnsortedSet([1J1 1J1])
>>> .contents
[1J1]

>>> {
>>> 	IdentitySet([1J1 1J1])
>>> }.hasError
true
```

The comparison method for `UnsortedSet` can be modified:

```
>>> let x = UnsortedSet();
>>> x.comparator := ~;
>>> x.includeAll([1, 1.0001, 2, 1, 2.00001, 3]);
>>> x
UnsortedSet([1 2 3])
```

* * *

See also: IdentitySet, SortedSet

Guides: Set Functions, Set Syntax
