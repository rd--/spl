# System

A `Type` representing the system (interpreter and host).

The global value `system` is the singular instance.

Type, trait and method dictionaries, timers, random number and unique identifier generators are implemented at `System`.

```
>>> system.typeOf
'System'

>>> let d = system.packageDictionary;
>>> d.includesKey('Colour')
true

>>> let d = system.methodDictionary;
>>> d.includesKey('includesKey')
true

>>> let d = system.traitDictionary;
>>> d.includesKey('Collection')
true

>>> let d = system.typeDictionary;
>>> d.includesKey('System')

>>> system.nextRandomFloat < 1
true

>>> system.uniqueId ~= system.uniqueId
true
```

* * *

See also: Cache, methodDictionary, packageDictionary, traitDictionary, typeDictionary, system

Categories: System, Type
