# uniqueId

- _uniqueId(system)_

Generate a unique idenfitier.
Identifiers are integers, and are unique only for the lifetime of `system`.

```
>>> let k = system.uniqueId;
>>> k.isInteger & { k >= 1 }
true
```

* * *

Categories: System

Guides: System Functions
