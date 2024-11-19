# LsXRand

- _LsXRand(list)_

Answer randomly selected items from _list_, however do not answer the same item twice in succession.

```
>>> LsXRand([1 3 5 7 9], 99).upToEnd.differentiate.includes(0).not
true
```

Equivalent to `LsRemDup` of `LsRand`:


```
>>> LsRemDup(LsRand([1 3 5 7 9], 99)).upToEnd.differentiate.includes(0).not
true
```

* * *

See also: LsRand, LsRemDup

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pxrand.html)

Categories: Stream
