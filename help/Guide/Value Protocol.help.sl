# Value Protocol

`Block` and `Association` implement `value`, in particular _value:/1_, directly.

```
>>> { 1 }.value
1

>>> ('x' -> 1).value
1
```

Systems that implement the _Value Protocol_ also implement _value:/1_ at `Object`,
meaning that every value _evaluates_ to itself unless it re-implements _value:/1_.

```
>>> 1.value
1
```

* * *

See also: Association, Block, value
