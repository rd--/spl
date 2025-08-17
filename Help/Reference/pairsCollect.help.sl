# pairsCollect

- _pairsCollect([x₁ x₂ …], f:/2)_

Apply the binary block _f_ to the items of the sequence _x_ taken two at a time,
moving forward two places each time.
Answer a `List` of the answers.

```
>>> 1:8.pairsCollect(+)
[1 + 2, 3 + 4, 5 + 6, 7 + 8]

>>> [1 2 3 5 6 9].pairsCollect(-.swap)
[2 - 1, 5 - 3, 9 - 6]
```

* * *

See also: adjacentPairsCollect, pairsDo, partition, tuples

Categories: Enumerating
