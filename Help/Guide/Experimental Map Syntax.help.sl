# Experimental Map Syntax

Rewrite rules:

- _[:]_ ⟹ _Map([])_
- _[k: v, …]_ ⟹ _Map([[k, v], …])_

The notation _[p: x, q: y]_ constructs a `Map` with associations _p → x_ and _q → y_.

```
>> 'Map[p x; q y]'.splSimplify
Map([[p, x], [q, y]])
```

With `String` keys:

```
>>> Map['x' 1; 'y' 2; 'z' 3]
>>> .asRecord
(x: 1, y: 2, z: 3)
```

With `SmallFloat` keys:

```
>>> let m = Map[1 'x'; 2 'y'; 3 'z'];
>>> (m.keys, m.values, m.associations)
(
	[1 2 3],
	['x' 'y' 'z'],
	[1 -> 'x', 2 -> 'y', 3 -> 'z']
)
```

Empty `Map`:

```
>>> let d = Map[];
>>> (d.isMap, d.isEmpty)
(true, true)
```

* * *

See also: Dictionary, Record, Map

Guides: Dictionary Syntax, Record Syntax, Syntax Guides
