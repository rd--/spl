# sliceFromTo

- _sliceFromTo(u, i, j)_

Answer a `Slice` of the sequence _u_ from start index _i_ to end index _j_,
inclusive of each index.

```
>>> let l = [1 3 2 4 6 5];
>>> let s = l.sliceFromTo(3, 5);
>>> (s.size, s.asList)
(3, [2 4 6])
```

The `average` and `median`, `min`, `max` and `sum` of a `slice`:

```
>>> let s = [1 3 2 4 6 5].sliceFromTo(3, 5);
>>> (
>>> 	s.average,
>>> 	s.median,
>>> 	s.min,
>>> 	s.max,
>>> 	s.sum
>>> )
(4, 4, 2, 6, 12)
```

* * *

See also: copyFromTo, Sequence, Slice
