# isAssociationList

- _isAssociationList(aList)_

Answer `true` if all items in _aList_ are instances of `Association`.

```
>>> ['x' -> 1, 'y' -> [2 3]].isAssociationList
true

>>> ['x' -> 1, 'y' -> [2 3]].asRecord
(x: 1, y: [2 3])
```

* * *

See also: allSatisfy, Association, isAssociation, isList

Categories: Testing
