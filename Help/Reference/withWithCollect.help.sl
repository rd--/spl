# withWithCollect

- _withWithCollect(c₁, c₂, c₃, f:/3)_

Answer the result of evaluating the block _f_ with corresponding elements from each collection _c_.

```
>>> [1 3 5 7 9].withWithCollect(
>>> 	[3 7 11 15 19],
>>> 	[5 11 17 23 29]
>>> ) { :p :q :r |
>>> 	p * q + r
>>> }
[8 32 72 128 200]
```

If the lists are not of equal size,
shorter lists are extended as required by recycling:

```
>>> [1 3 5 7 9].withWithCollect(
>>> 	[3 7 11 15],
>>> 	[5 11 17]
>>> ) { :p :q :r |
>>> 	p * q + r
>>> }
[8 32 72 110 38]
```

* * *

See also: collect, map, withCollect

Guides: List Functions

Categories: Enumerating
