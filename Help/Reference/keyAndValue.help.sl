# keyAndValue

- _keyAndValue(k → v)_
- _keyAndValue(k → v, k′, v′)_

Answer both the key and the value of an association.

```
>>> (1 -> 3).keyAndValue
[1 3]

>>> (1 -> 3).key
1

>>> (1 -> 3).value
3
```

The ternary form mutates the association:

```
>>> let x = 1 -> 3;
>>> let y = x.keyAndValue(2, 4);
>>> (x == y, x)
(true, 2 -> 4)
```

* * *

See also: key, value

Guides: Dictionary Functions
