# LsSer

- _LsSer(α, β)_ ⟹ _LsTake(LsCyc(α), β)_

Take the first β items of the `LsCyc` of α.

```
>>> LsSer(
>>> 	[
>>> 		LsGeom(1, 3, 3),
>>> 		-1,
>>> 		LsSeries(1, 3, 3)
>>> 	],
>>> 	14
>>> ).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

Equivalent to `LsTake`, or `take`, of `LsCyc`:

```
>>> LsCyc(
>>> 	[
>>> 		LsGeom(1, 3, 3),
>>> 		-1,
>>> 		LsSeries(1, 3, 3)
>>> 	]
>>> ).take(14).upToEnd
[1 3 9 -1 1 4 7 1 3 9 -1 1 4 7]
```

* * *

See also: LsCat, LsN, LsSeq, LsTake

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pser.html)

Categories: Stream
