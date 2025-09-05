# IdentitySet

- _IdentitySet()_

A collection of objects without duplicates.
The comparison operator is `==`, not `=`,
i.e. `IdentitySet` is an identity set, not an equality set.

The empty set constructor:

```
>>> IdentitySet().size
0
```

Set predicate:

```
>>> IdentitySet()
>>> .isIdentitySet
true

>>> IdentitySet()
>>> .isSet
true
```

Sets are unordered collections,
and have the expected mathematical behavior in relation to scalars:

```
>>> [1 2 3].asIdentitySet * 5
[5 10 15].asIdentitySet
```

* * *

See also: asIdentitySet, add, IdentityBag, include, isImmediate, isIdentitySet, List

Guides: Set Functions

References:
_Smalltalk_
5.7.7

Categories: Collection, Type
