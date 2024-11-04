# LsLace

- _LsLace(list, length)_

Apply `LsForever` at each element in _list_ and interlace the elements of the answers.
This is a kind of _transposition_.

```
>>> LsLace([1, LsCyc([2 5]), LsCyc([3 4])], 8).upToEnd
[1 2 3 1 5 4 1 2]
```

* * *

See also: LsTuple

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Place.html)
