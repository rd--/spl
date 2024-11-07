# LsSwitch

- _LsSwitch(list, which)_

Choose elements from _list_ according to _which_.

With constant items and a constant index:

```
>>> LsSwitch([1 3 5], 2).next(3)
[3 3 3]
```

If the element is itself a stream, all items are taken for each index.

```
>>> LsSeq([1 2], 2).upToEnd
[1 2 1 2]

>>> LsSeq([6 7], 1).upToEnd
[6 7]

>>> let a = LsSeq([1 2], 2);
>>> let b = LsSeq([6 7], 1);
>>> let c = LsSeq([3 3 1 2], inf);
>>> LsSwitch([a b 8], c).next(13)
[8 8 1 2 1 2 6 7 8 8 1 2 1]
```

* * *

See also: LsSwitch1

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pswitch.html)
