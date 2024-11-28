# typeDictionary

- _typeDictionary(aSystem)_

A `Dictionary` at `System` to hold the set of `Type`s.

```
>>> system.typeDictionary.isDictionary
true

>>> system.typeDictionary.includesKey('List')
true

>>> system.typeDictionary['List'].isType
true

>>> let t = system.typeDictionary['List'];
>>> t.methodDictionary.includesKey('isList:/1')
true
```

* * *

See also: methodDictionary, packageDictionary, System, traitDictionary, Type

Categories: Reflection, System
