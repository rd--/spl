# LsFold

- _LsFold(α, β)_ ⟹ LsLast(LsScan(α, β))

Answer the last element of an LsScan.

```
>>> LsFold(LsSeries(1, 1, 9), +)
45

>>> LsFold(LsSeries(1, 1, 9), *)
362880

>>> LsFold(LsSeries(1, 1, 9), -)
-43
```

* * *

See also: LsLast, LsScan, LsUnfold
