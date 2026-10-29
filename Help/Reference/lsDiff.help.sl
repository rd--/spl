# lsDiff

- _lsDiff(input)_

Answer a stream of the differences between the current and previous values of _input_.

```
>>> lsDiff(lsGeom(1, 2, 9)).upToEnd
[1 2 4 8 16 32 64 128]
```

* * *

See also: lsAdjacent, adjacentPairsCollect, adjacentPairsDo

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pdiff.html)

Categories: Stream
