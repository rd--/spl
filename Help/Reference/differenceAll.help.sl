# differenceAll

- _differenceAll(c₁, c₂, =)_

Answer a value like the collection _c₁_ that contains elements from _c₁_ that
do not occur in any collection that is an element of _c₂_,
according to the equality predicate _=_,
which is taken to be `=` if elided.

```
>>> 1:75.differenceAll(
>>> 	[
>>> 		13:18, 22:27, 31:36,
>>> 		40:45, 49:57, 61:65
>>> 	]
>>> )
[
	1:12, 19:21, 28:30,
	37:39, 46:48, 58:60,
	66:75
].catenate
```

* * *

See also: difference

Guides: Set Functions

Categories: Set, Logic
