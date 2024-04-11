# lastIndex

- _lastIndex(aSequence)_

Answer the last index of _aSequence_.
This is often, but not necessarily, equal to `size`.

At `Range`:

```
>>> 3:7.lastIndex
5
```

At `List`:

``>>> [3 4 5 6 7].lastIndex
5
```

At `Slice`:

```
>>> let c = [1 .. 9].slice(3, 7);
>>> (c.lastIndex, c.size)
(7, 5)
```

* * *

See also: firstIndex, indices, last, size

Categories: Accessing
