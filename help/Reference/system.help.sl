# system

_system_ is the name of the singular instance of the `System` type.

```
>>> system.methodDictionary.keys.includes('sum')
true

>>> system.traitDictionary.keys.includes('Collection')
true

>>> system.typeDictionary.keys.includes('List')
true
```

It holds the `Method`, `Trait` and `Type` dictionaries.

```
>>> system.methodDictionary.size > 1000
true

>>> system.traitDictionary.size > 10
true

>>> system.typeDictionary.size > 50
true
```

* * *

See also: System

Categories: Reflection
