# lsAccum

- _lsAccum(α)_ ⟹ _lsScan(α, +)_

Answer the prefix or partial sum of α.

```
>>> lsAccum(lsSeries(1, 1, 9)).upToEnd
[1 3 6 10 15 21 28 36 45]
```

Equivalent to `lsScan` of `+`:

```
>>> lsScan(lsSeries(1, 1, 9), +).upToEnd
[1 3 6 10 15 21 28 36 45]
```

* * *

See also: +, lsScan

Categories: Stream
