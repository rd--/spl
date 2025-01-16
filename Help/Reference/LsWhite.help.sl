# LsWhite

- _LsWhite(low, high, length, randomNumberGenerator)_

Random values that follow a uniform distribution.

~~~spl svg=A
LsWhite(-1, 1, 99, Sfc32(240981))
.upToEnd
.linePlot
~~~

![](sw/spl/Help/Image/LsWhite-A.svg)

Diverging range:

~~~spl svg=B
LsWhite(
	LsSeries(0, -1, inf),
	LsSeries(0, 1, inf),
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
