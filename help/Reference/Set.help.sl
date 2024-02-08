# Set

_Set()_

A collection of objects without duplicates.
The comparison operator is ==, not =, i.e. Set is an identity set, not an equality set.
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

Set from List:

```
>>> [1 1 2 1 2 3].asSet.size
3
```

Set from Tuple:

```
>>> (1, 1, 2, 1, 2, 3).asSet.size
3
```

Set from String:

```
'abracadabra'.asSet.size
5
```

Lists that compare = do not compare ==:

```
>>> [1 1; 1 1].basicAsSet.size
2

>>> { [1 1; 1 1].asSet }.ifError { true }
true
```

Note:
Set is what Smalltalk calls _IdentitySet_.

* * *

See also: asSet, add, Bag, isSet, List

Categories: Collection, Type
