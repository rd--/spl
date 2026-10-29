# lsTuple

- _lsTuple(list, repeats)_

Apply `lsForever` at each element in _list_, and at each iteration answer a list of the next answer of each list item.
When any of list item ends, that repeat and all of the list items are reset.

```
>>> lsTuple(
>>> 	[
>>> 		lsCyc([1 .. 5]),
>>> 		lsSeq([5 6 7], 2)
>>> 	],
>>> 	1
>>> ).upToEnd
[1 5; 2 6; 3 7; 4 5; 5 6; 1 7; 1 5]
```

* * *

See also: lsCyc, lsForever, lsLace, lsSeq

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Ptuple.html)

Categories: Stream
