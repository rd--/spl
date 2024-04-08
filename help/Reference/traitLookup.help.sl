# traitLookup

- _traitLookup(aSystem, aString)_

Answer the `Trait` named by _aString_ at _aSystem_.

```
>>> system.traitLookup('Collection').isTrait
true
```

The `methodDictionary` at a `Trait` is keyed by qualified method names:

```
>>> let t = system.traitLookup('Iterable');
>>> t.methodDictionary.includesKey('sum:/1')
true
```

* * *

See also: System, Trait

Categories: System, Reflection
