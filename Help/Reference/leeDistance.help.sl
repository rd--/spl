# leeDistance

- _leeDistance([x₁ x₂ …], [y₁ y₂ …], q)_

Answer the Lee distance between the sequences _x_ and _y_.

```
>>> let x = [3 1 4 0];
>>> let y = [2 5 4 3];
>>> let q = 6;
>>> let z = (x - y).abs;
>>> (
>>> 	x.leeDistance(y, q),
>>> 	z.min(q - z).sum
>>> )
(6, 6)

>>> [1 2 3].leeDistance([3 2 1], 3)
2
```

* * *

See also: hammingDistance

Guides: Distance Functions
