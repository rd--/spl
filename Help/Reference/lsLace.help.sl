# lsLace

- _lsLace(list, length)_

Apply `lsForever` at each element in _list_ and interlace the elements of the answers.
This is a kind of _transposition_.

```
>>> lsLace(
>>> 	[
>>> 		1,
>>> 		lsCyc([2 5]),
>>> 		lsCyc([3 4])
>>> 	],
>>> 	8
>>> ).upToEnd
[1 2 3 1 5 4 1 2]
```

* * *

See also: lsTuple

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Place.html)

Categories: Stream
