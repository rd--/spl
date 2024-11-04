# LsDiff

- _LsDiff(input)_

Answer a stream of the differences between the current and previous values of _input_.

```
>>> LsDiff(LsGeom(1, 2, 9)).upToEnd
[1 2 4 8 16 32 64 128]
```

* * *

See also: adjacentPairsCollect, adjacentPairsDo, LsAdjacent

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pdiff.html)
