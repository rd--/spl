# lsWhite

- _lsWhite(low, high, length, randomNumberGenerator)_

Random values that follow a uniform distribution.

Reset does not reset random number generator:

```
>>> let r = Sfc32(189314);
>>> let l = lsWhite(-1, 1, Infinity, r);
>>> let a = l.next(99);
>>> (l.reset!, l.next(99) != a)
(0, true)
```

Uniform distribution of numbers in _-1,1_:

~~~spl svg=A
lsWhite(-1, 1, 99, Sfc32(240981))
.upToEnd
.linePlot
~~~

![](Help/Image/lsWhite-A.svg)

Diverging range:

~~~spl svg=B
lsWhite(
	lsSeries(0, -1, Infinity),
	lsSeries(0, 1, Infinity),
	99,
	Sfc32(538921)
).upToEnd.linePlot
~~~

![](Help/Image/lsWhite-B.svg)

* * *

See also: lsBeta, lsBrown, lsRand

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pwhite.html)

Categories: Stream
