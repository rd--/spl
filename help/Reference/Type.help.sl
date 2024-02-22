# Type

A _Type_ describes a kind of value.

The _system_ dictionary holds a _typeDictionary_.

```
>>> system.typeDictionary.isDictionary
true

>>> system.typeDictionary.includesKey('List')
true

>>> system.typeLookup('List').isType
true

>>> system.typeLookup('List').name
'List'

>>> system.typeLookup('List').methodDictionary.includesKey('shallowCopy:/1')
true

>>> system.typeLookup('List').methodDictionary['shallowCopy:/1'].isMethod
true
```

* * *

See also: Trait

Categories: Type
