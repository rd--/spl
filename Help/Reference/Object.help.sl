# Object

`Object` is a `Trait`.
Ordinarily all `Type` definitions should implement `Object`.

`Object` defines the basic system predicates.

```
>>> system.traitTypes('Object').size + 1
system.typeDictionary.size

>>> system
>>> .traitDictionary['Object']
>>> .methodDictionary
>>> .keys
>>> .includes('respondsTo:/2')
true
```

Methods for comparing objects: `==`, `~~`, `=`, `!=`

Methods for copying objects: `copy`, `shallowCopy`, `deepCopy`, `veryDeepCopy`

Methods for displaying and storing objects: `printString`, `printOn`, `storeString`, `storeOn`

* * *

See also: Trait

Guides: Reflection Functions

References:
_Smalltalk_
5.3.1

Categories: Value, Trait
