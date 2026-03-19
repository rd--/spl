# pairsDo

- _pairsDo([x₁ x₂ …], f:/2)_

Apply the binary block _f_ to the items of the sequence _x_ taken two at a time,
moving forward two places each time.
The iterative form of `pairsCollect`.

```
>>> let a = [];
>>> [1 2 3 4 5].pairsDo { :i :j |
>>> 	a.add([i, j, i + j])
>>> };
>>> a
[1 2 3; 3 4 7]
```

* * *

See also: adjacentPairsDo, pairsCollect

Guides: Iteration Functions

Categories: Enumerating
