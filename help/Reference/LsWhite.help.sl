# LsWhite

- _LsWhite(low, high, length)_

Random values that follow a uniform distribution.

~~~
LsWhite(-1, 1, 99).upToEnd.linePlot
~~~

Diverging range:

~~~
LsWhite(
	LsSeries(0, -1, inf),
	LsSeries(0, 1, inf),
	99
).upToEnd.linePlot
~~~

* * *

See also: LsBrown, LsRand

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pwhite.html)

Categories: Stream
