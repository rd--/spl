# Set

- _Set([x₁ x₂ …])_

Set is both a `Trait` holding behaviours for collection types that do not contain duplicate items,
and a `Type` representing a set where the comparison operator is `=`.

The empty set constructor,
also a `Set` from an empty list:

```
>>> Set().size
0

>>> Set([]).size
0
```

Set predicate:

```
>>> Set().isSet
true

>>> Set().isIdentitySet
false
```

Sets are unordered collections,
and have the expected mathematical behavior in relation to scalars:

```
>>> Set([1 2 3]) * 5
Set([5 10 15])
```

Note that `Set` may be significantly less efficient that `IdentitySet`,
however `==` has some subtle behaviours:

```
>>> 1/1 == 1/1
false

>>> 1 == 1L
false

>>> Set([1 1L])
>>> .contents
[1]

>>> {
>>> 	IdentitySet([1 1L])
>>> }.ifError { true }
true
```

* * *

See also: IdentitySet

Guides: Set Functions
