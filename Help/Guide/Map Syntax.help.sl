# Map Syntax

- _[:]_
- _[k: v, …]_

The notation _[:]_ answers an empty `Map`.
The notation _[p: x, q: y]_ constructs a `Map` with associations _p → x_ and _q → y_.

Rewrite rule:

```
>> '[p: x, q: y]'.splSimplify
Map([[p, x], [q, y]])
```

With `String` keys:

```
>>> ['x': 1, 'y': 2, 'z': 3]
Map['x' 1; 'y' 2; 'z' 3]
```

With `Float` keys:

```
>>> let m = [1: 'x', 2: 'y', 3: 'z'];
>>> (m.keys, m.values, m.associations)
(
	[1 2 3],
	['x' 'y' 'z'],
	[1 -> 'x', 2 -> 'y', 3 -> 'z']
)
```

Empty `Map`:

```
>>> let d = [:];
>>> (d.isMap, d.isEmpty)
(true, true)
```

* * *

See also: Dictionary, Map, Record

Guides: Dictionary Syntax, Record Syntax, Syntax Guides
