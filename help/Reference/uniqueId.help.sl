# uniqueId

- _uniqueId(aSystem)_

Generate a unique idenfitier.
Identifiers are integers, and are unique only for the lifetime of _aSystem_.

```
>>> let k = system.uniqueId;
>>> k.isInteger & { k >= 1 }
true
```

* * *

Categories: System
