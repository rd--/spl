# LsWhite

- _LsWhite(low, high, length, randomNumberGenerator)_

Random values that follow a uniform distribution.

Reset does not reset seed:

```
>>> let l = LsWhite(-1, 1, Infinity, Sfc32(189314));
>>> let a = l.next(99);
>>> l.reset;
>>> l.next(99) ~= a
true
```

Plot:

~~~spl svg=A
LsWhite(-1, 1, 99, Sfc32(240981))
.upToEnd
.linePlot
~~~

![](sw/spl/Help/Image/LsWhite-A.svg)

Diverging range:

~~~spl svg=B
LsWhite(
	LsSeries(0, -1, Infinity),
	LsSeries(0, 1, Infinity),
	99,
	Sfc32(538921)
).upToEnd.linePlot
~~~

![](sw/spl/Help/Image/LsWhite-B.svg)

* * *

See also: LsBeta, LsBrown, LsRand

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pwhite.html)

Categories: Stream
