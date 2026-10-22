# traitDictionary

- _traitDictionary(system)_

A `Dictionary` at `system` to hold the set of `Trait`s.

```
>>> system
>>> .traitDictionary['@Collection']
>>> .isTrait
true

>>> system
>>> .traitDictionary['@Do']
>>> .methodDictionary
>>> .includesKey('sum/1')
true
```

* * *

See also: System, Trait, methodDictionary, packageDictionary, typeDictionary

Guides: Reflection Functions

Categories: Reflection, System
