# withCollectInPlace

- _withCollect!(c₁, c₂, f/2)_

In place `withCollect`.
Answers `nil`.

At `List`:

```
>>> let c = [9, 8 .. 1];
>>> c.withCollect!(1:9) { :p :q |
>>> 	p * 2 + q
>>> };
>>> c
[19, 18 .. 11]
```

Compare to `withCollect`:

```
>>> let c = [9, 8 .. 1];
>>> let d = c.withCollect(1:9) { :p :q |
>>> 	p * 2 + q
>>> };
>>> (c, d)
([9, 8 .. 1], [19, 18 .. 11])
```

* * *

See also: collect, collectInPlace, withCollect

Guides: List Functions
