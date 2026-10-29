# lsSwitch1

- _lsSwitch1(list, which)_

Choose elements from _list_ according to _which_.

With constant items and a constant index:

```
>>> lsSwitch1([1 3 5], 2).next(3)
[3 3 3]
```

If the element is itself a stream, only one item is taken for each index.

```
>>> lsSeries(1, 2, 3).upToEnd
[1 3 5]

>>> lsGeom(2, 3, 3).upToEnd
[2 6 18]

>>> lsSwitch1(
>>> 	[
>>> 		lsSeries(1, 2, 3),
>>> 		lsGeom(2, 3, 3)
>>> 	],
>>> 	lsCyc([1, 2])
>>> ).next(9)
[1 2 3 6 5 18 1 2 3]
```

* * *

See also: lsSwitch

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pswitch1.html)

Categories: Stream
