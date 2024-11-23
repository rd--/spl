# LsAccum

- _LsAccum(α)_ ⟹ _LsScan(α, +)_

Answer the prefix or partial sum of α.

```
>>> LsAccum(LsSeries(1, 1, 9)).upToEnd
[1 3 6 10 15 21 28 36 45]
```

Equivalent to `LsScan` of `+`:

```
>>> LsScan(LsSeries(1, 1, 9), +).upToEnd
[1 3 6 10 15 21 28 36 45]
```

* * *

See also: +, LsScan

Categories: Stream
