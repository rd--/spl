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
>>> let m = t.methodDictionary;
>>> m.includesKey('sum:/1')
true
```

* * *

See also: Method, System, Trait

Categories: System, Reflection
