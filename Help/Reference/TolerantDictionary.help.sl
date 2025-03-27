# TolerantDictionary

- _TolerantDictionary()_

A `Type` representing a dictionary where keys are compared using the tolerant equality operator `~`.

```
>>> let d = TolerantDictionary();
>>> d[0] := 1;
>>> d[1E-9] := 2;
>>> d[-1E-9] := 3;
>>> (d.size, d.associations)
(1, [0 -> 3])
```

* * *

See also: Dictionary, EqualityDictionary, Map, Record
