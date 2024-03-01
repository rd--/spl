# traitLookup

- _traitLookup(aSystem, aString)_

A method at `System` to lookup a `Trait` value by name.

```
>>> system.traitLookup('Collection').isTrait
true

>>> system.traitLookup('Iterable').methodDictionary.includesKey('sum:/1')
true
```

* * *

See also: System, Trait

Categories: System, Reflection
