# Dictionary Syntax

Rewrite rule:

- _[k: v, ...]_ ⟹ _[k → v, ...].asDictionary_

With `String` keys:

```
>>> ['x': 1, 'y': 2, 'z': 3]
>>> .asRecord
(x: 1, y: 2, z: 3)
```

With `SmallFloat` keys:

```
>>> let d = [1: 'x', 2: 'y', 3: 'z'];
>>> (d.keys, d.values, d.associations)
(
	[1 2 3],
	['x' 'y' 'z'],
	[1 -> 'x', 2 -> 'y', 3 -> 'z']
)
```

* * *

See also: Dictionary, Record, Map

Guides: Record Syntax
