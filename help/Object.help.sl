# Object -- value trait

_Object_ is a _Trait_.
Ordinarily _all_ types should implement _Object_.

Object defines the basic system predicates.

```
system.traitTypes('Object') + 1 = system.typeDictionary.size
system.traitDictionary['Object'].methodDictionary.keys.includes('respondsTo:/2') = true
```
