# asDictionary

- _asDictionary(aCollection, aBlock:/2)_

At `List` of `Association` values:

```
>>> let l = [1 -> -1, 2 -> -2, 3 -> -3];
>>> let d = l.asDictionary(=);
>>> (l.size, d.size, d.keys, d.values)
(3, 3, [1 2 3], [-1 -2 -3])
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).asDictionary(=)
['x' -> 1, 'y' -> 2, 'z' -> 3].asDictionary(=)
```

At `Map`:

```
>>> (x: 1, y: 2, z: 3).asMap.asDictionary(=)
['x' -> 1, 'y' -> 2, 'z' -> 3].asDictionary(=)
```

* * *

See also: asMap, asRecord, Association, Dictionary, List, Map, Record
