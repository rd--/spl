# LsSelect

- _LsSelect(α, β)_ ⟹ _α.select(β)_

Answer a stream that skips over items from α that do not answer true for the predicate β.

```
>>> LsSeries(1, 1, 9).select(isEven:/1).upToEnd
[2 4 6 8]
```

* * *

See also: LsCollect, LsReject
