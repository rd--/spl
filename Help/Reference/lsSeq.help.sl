# lsSeq

- _lsSeq(α, β)_ ⟹ _lsN(lsCat(α), β)_

Repeat the `lsCat` of α β times.

```
>>> lsSeq(
>>> 	[
>>> 		lsGeom(1, 3, 3),
>>> 		-1,
>>> 		lsSeries(1, 3, 3)
>>> 	],
>>> 	2
>>> ).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

Equivalent to `lsN`, or `repeat`, of `lsCat`:

```
>>> lsCat(
>>> 	[
>>> 		lsGeom(1, 3, 3),
>>> 		-1,
>>> 		lsSeries(1, 3, 3)
>>> 	]
>>> ).repeat(2).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

* * *

See also: lsCat, lsN, lsSer

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pseq.html)

Categories: Stream
