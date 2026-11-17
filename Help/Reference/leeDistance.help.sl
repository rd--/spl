# leeDistance

- _leeDistance([x₁ x₂ …], [y₁ y₂ …], q)_

Answer the Lee distance between the sequences _x_ and _y_.

```
>>> let x = [3L 1L 4L 0L];
>>> let y = [2L 5L 4L 3L];
>>> let q = 6L;
>>> let z = (x - y).abs;
>>> (
>>> 	x.leeDistance(y, q),
>>> 	z.min(q - z).sum
>>> )
(6L, 6L)

>>> [1L 2L 3L].leeDistance([3L 2L 1L], 3L)
2L
```

* * *

See also: hammingDistance

Guides: Distance Functions, Similarity Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Lee_distance)
