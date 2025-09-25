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
>>> let a = [1 3 2 4 6 5];
>>> let b = a.sliceFromTo(3, 5);
>>> (
>>> 	b.average,
>>> 	b.median,
>>> 	b.min,
>>> 	b.max,
>>> 	b.sum
>>> )
(4, 4, 2, 6, 12)
```

* * *

See also: copyFromTo, Sequence, Slice

Guides: List Functions
