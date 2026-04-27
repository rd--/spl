# uniqueIdentifier

- _uniqueIdentifier(system)_

Generate a unique idenfitier.
Identifiers are integers, and are unique only for the lifetime of `system`.

```
>>> let k = system.uniqueIdentifier;
>>> k.isInteger & { k >= 1 }
true
```

The generator is a simple counter:

```
>>> let p = system.uniqueIdentifier;
>>> let q = system.uniqueIdentifier;
>>> p + 1 = q
true
```

* * *

Categories: System

Guides: System Functions
