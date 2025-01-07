# Set

- _Set()_

A collection of objects without duplicates.
The comparison operator is `==`, not `=`,
i.e. `Set` is an identity set, not an equality set.

The empty set constructor:

```
>>> Set().size
0
```

Set predicate:

```
>>> Set().isSet
true
```

Sets are unordered collections,
and have the expected mathematical behavior in relation to scalars:

```
>>> [1 2 3].asSet * 5
[5 10 15].asSet
```

Note:
`Set` is what Smalltalk calls _IdentitySet_.

* * *

See also: asSet, add, Bag, isImmediate, isSet, List

References:
_Smalltalk_
5.7.7

Categories: Collection, Type
