# LsBrown

- _LsBrown(low, high, step, length)_

Brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution.

~~~spl svg=A
LsBrown(-1, 1, 1 / 100, 99)
.upToEnd
.linePlot
~~~

![](sw/spl/Help/Image/LsBrown-A.svg)

* * *

See also: LsBeta, LsCauchy, LsWhite

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbrown.html)

Categories: Stream
