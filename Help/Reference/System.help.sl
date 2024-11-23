# System

A `Type` representing the system (interpreter and host).

The global value `system` is the singular instance.

Type, trait and method dictionaries, timers, random number and unique identifier generators are implemented at `System`.

```
>>> system.typeOf
'System'

>>> system.typeDictionary.keys.includes('System')
true

>>> system.nextRandomFloat < 1
true

>>> system.uniqueId ~= system.uniqueId
true
```

* * *

See also: Cache, system

Categories: System, Type
