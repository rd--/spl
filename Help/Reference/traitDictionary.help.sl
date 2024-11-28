# traitDictionary

- _traitDictionary(aSystem)_

A `Dictionary` at `System` to hold the set of `Trait`s.

```
>>> system.traitDictionary['Collection'].isTrait
true

>>> let trait = system.traitDictionary['Iterable'];
>>> trait.methodDictionary.includesKey('sum:/1')
true
```

* * *

See also: methodDictionary, packageDictionary, System, Trait, typeDictionary

Categories: Reflection, System
