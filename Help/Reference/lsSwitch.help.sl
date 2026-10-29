# lsSwitch

- _lsSwitch(list, which)_

Choose elements from _list_ according to _which_.

With constant items and a constant index:

```
>>> lsSwitch([1 3 5], 2).next(3)
[3 3 3]
```

If the element is itself a stream, all items are taken for each index.

```
>>> lsSeq([1 2], 2).upToEnd
[1 2 1 2]

>>> lsSeq([6 7], 1).upToEnd
[6 7]

>>> let a = lsSeq([1 2], 2);
>>> let b = lsSeq([6 7], 1);
>>> let c = lsSeq([3 3 1 2], Infinity);
>>> lsSwitch([a b 8], c).next(13)
[8 8 1 2 1 2 6 7 8 8 1 2 1]
```

* * *

See also: lsSeq, lsSwitch1

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pswitch.html)

Categories: Stream
