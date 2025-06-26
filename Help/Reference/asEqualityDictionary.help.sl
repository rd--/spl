# asEqualityDictionary

- _asEqualityDictionary(aList)_

At `List` of `Association` values:

```
>>> let l = [1 -> -1, 2 -> -2, 3 -> -3];
>>> let d = l.asEqualityDictionary;
>>> (l.size, d.size, d.keys, d.values)
(3, 3, [1 2 3], [-1 -2 -3])
```

* * *

See also: asMap, asRecord, Association, Dictionary, List, Map, Record
