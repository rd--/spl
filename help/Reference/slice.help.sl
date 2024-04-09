# slice

- _slice(aSequence, firstIndex, lastIndex)_

Answer a `Slice` of _aSequence_ from _firstIndex_ to _lastIndex_.

```
>>> [1 3 2 4 6 5].slice(3, 5).asList
[2 4 6]
```

The `average` and `median`, `min`, `max` amd `sum` of a `slice`:

```
>>> let s = [1 3 2 4 6 5].slice(3, 5);
>>> (s.average, s.median, s.min, s.max, s.sum)
(4, 4, 2, 6, 12)
```

* * *

See also: firstIndex, indices, lastIndex, Sequence, Slice
