# lsSer

- _lsSer(α, β)_ ⟹ _lsTake(lsCyc(α), β)_

Take the first β items of the `lsCyc` of α.

```
>>> lsSer(
>>> 	[
>>> 		lsGeom(1, 3, 3),
>>> 		-1,
>>> 		lsSeries(1, 3, 3)
>>> 	],
>>> 	14
>>> ).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

Equivalent to `lsTake`, or `take`, of `lsCyc`:

```
>>> lsCyc(
>>> 	[
>>> 		lsGeom(1, 3, 3),
>>> 		-1,
>>> 		lsSeries(1, 3, 3)
>>> 	]
>>> ).take(14).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

* * *

See also: lsCat, lsN, lsSeq, lsTake

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pser.html)

Categories: Stream
