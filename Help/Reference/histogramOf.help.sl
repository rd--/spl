# histogramOf

- _histogramOf(c, f/1, =)_

Answer a `Multiset` of `collect` of _f_ of _c_.

```
>>> let l = [1.1 2.1 3.1 1.9 2.9 1.1];
>>> let h = l.histogramOf(round/1, ==);
>>> h.sortedElements
[1 -> 2, 2 -> 2, 3 -> 2]
```

* * *

See also: Multiset

Guides: Collection Functions
