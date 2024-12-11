# histogramOf

- _histogramOf(aCollection, aBlock:/1)_

A more efficient form of _aCollection.collect(aBlock:/1).asBag_.

```
>>> let l = [1.1 2.1 3.1 1.9 2.9 1.1];
>>> let h = l.histogramOf(rounded:/1);
>>> h.sortedElements
[1 -> 2, 2 -> 2, 3 -> 2]
```

* * *

See also: asBag, Bag

Categories: Converting
