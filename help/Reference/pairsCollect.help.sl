# pairsCollect

- _pairsCollect(aSequence, aBlock:/2)_

Apply _aBlock_ to succesive adjacent pairs of _aSequence_.
Answer a List of the answers.

```
>>> 1:8.pairsCollect(+)
[1 + 2, 3 + 4, 5 + 6, 7 + 8]

>>> [1 2 3 5 6 9].pairsCollect(-.swap)
[2 - 1, 5 - 3, 9 - 6]
```

* * *

See also: pairsDo
