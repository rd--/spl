# Object

_Object_ is a _Trait_.
Ordinarily _all_ types should implement _Object_.

Object defines the basic system predicates.

```
>>> system.traitTypes('Object').size + 1
system.typeDictionary.size

>>> system.traitDictionary['Object'].methodDictionary.keys.includes('respondsTo:/2')
true
```

Methods for comparing objects: ==, ~~, =, ~=

Methods for copying objects: copy, shallowCopy, deepCopy, veryDeepCopy

Methods for displaying and storing objects: printString, printOn, storeString, storeOn

* * *

Categories: Value, Trait
