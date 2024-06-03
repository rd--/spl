# AssociationList

- _AssociationList()_
- _AssociationList(aList)_

A `Type` that implements a `Dictionary` where the uniqueness of keys is determined using `=`.
This type is less efficient than both `Map` and `Record`.

An empty `AssociationList`:

```
>>> let d = AssociationList();
>>> (d.size, d.isEmpty)
(0, true)
```

An `AssociationList` with lists for keys:

```
>>> let d = [[1 2] -> 3, [4 5] -> 6].asAssociationList;
>>> (d.keys, d.keys.collect { :each | d[each] }, d.values)
([1 2; 4 5], [3 6], [3 6])
```

* * *

See also: Dictionary, Map, Record
