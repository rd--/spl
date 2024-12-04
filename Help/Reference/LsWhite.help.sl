# LsWhite

- _LsWhite(low, high, length)_

Random values that follow a uniform distribution.

~~~spl svg=A
LsWhite(-1, 1, 99).upToEnd.linePlot
~~~

![](sw/spl/Help/Image/LsWhite-A.svg)

Diverging range:

~~~spl svg=B
LsWhite(
	LsSeries(0, -1, inf),
	LsSeries(0, 1, inf),
	99
).upToEnd.linePlot
~~~

![](sw/spl/Help/Image/LsWhite-B.svg)

* * *

See also: LsBeta, LsBrown, LsRand

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pwhite.html)

Categories: Stream
