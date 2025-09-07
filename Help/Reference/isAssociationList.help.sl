# isAssociationList

- _isAssociationList(x)_

Answer `true` if all items in the list _x_ are instances of `Association`.

```
>>> [1 -> 2, 3 -> 4]
>>> .isAssociationList
true

>>> ['x' -> 1, 'y' -> [2 3]]
>>> .isAssociationList
true

>>> ['x' -> 1, 'y' -> [2 3]]
>>> .asRecord
(x: 1, y: [2 3])
```

* * *

See also: allSatisfy, Association, isAssociation, isList

Guides: Dictionary Functions

Categories: Testing
