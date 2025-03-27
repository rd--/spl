# EqualityDictionary

- _EqualityDictionary()_

A `Type` representing a dictionary where keys are compared according to equality.

The `EqualityDictionary` type is less efficient than both `Map` and `Record`.

An empty `EqualityDictionary`:

```
>>> let d = EqualityDictionary();
>>> (d.size, d.isEmpty, d.comparator)
(0, true, =)
```

An `EqualityDictionary` with lists for keys:

```
>>> let d = [
>>> 	[1 2] -> 3,
>>> 	[4 5] -> 6
>>> ].asEqualityDictionary;
>>> (
>>> 	d.keys,
>>> 	d.keys.collect { :each | d[each] },
>>> 	d.values
>>> )
([1 2; 4 5], [3 6], [3 6])
```

* * *

See also: Dictionary, Map, Record, TolerantDictionary
