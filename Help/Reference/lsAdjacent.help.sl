# lsAdjacent

- _lsAdjacent(s, f/2)_

Apply _f_ to adjacent items of the input stream _s_.

Sum of adjacent items, one and two, then two and three, then three and four and so on:

```
>>> lsAdjacent(lsSeries(1, 1, 9), +)
>>> .upToEnd
[3 5 7 9 11 13 15 17]
```

Product of adjacent items:

```
>>> lsAdjacent(lsSeries(1, 1, 9), *)
>>> .upToEnd
[2 6 12 20 30 42 56 72]
```

* * *

See also: adjacentPairsCollect, adjacentPairsDo, lsDiff, lsSeries

Guides: Patterns and Streams

Categories: Stream
