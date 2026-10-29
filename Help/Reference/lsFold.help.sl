# lsFold

- _lsFold(α, β)_ ⟹ lsLast(lsScan(α, β))

Answer the last element of an lsScan.

```
>>> lsFold(lsSeries(1, 1, 9), +)
45

>>> lsFold(lsSeries(1, 1, 9), *)
362880

>>> lsFold(lsSeries(1, 1, 9), -)
-43
```

* * *

See also: lsLast, lsScan, lsUnfold

Categories: Stream
