# traitLookup

- _traitLookup(s, t)_

At `System`,
answer the `Trait` named by _t_.

```
>>> system
>>> .traitLookup('Collection')
>>> .isTrait
true
```

The `methodDictionary` at a `Trait` is keyed by qualified method names:

```
>>> system.traitLookup('Iterable')
>>> .methodDictionary
>>> .includesKey('sum:/1')
true
```

* * *

See also: Method, System, Trait

Guides: Reflection Functions

Categories: System, Reflection
