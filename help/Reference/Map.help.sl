# Map

_Map_ is a dictionary type where the keys are compared using the identitcal to (==) operator.

- _Map()_

Construct an empty _Map_.

```
>>> Map().isMap
true
```

- _asMap(anAssociationList)_
- _asMap(aRecord)_

Construct a _Map_ from a List of associations, or from a Record.

```
>>> ['x' -> 1, 'y' -> 2].asMap.isMap
true

>>> (x: 1, y: 2).asMap.isMap
true
```

Note: Map is _IdentityDictionary_ in Smalltalk.

* * *

See also: Dictionary, Record

Categories: Collection, Type
