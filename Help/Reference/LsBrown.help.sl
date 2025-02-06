# LsBrown

- _LsBrown(low, high, step, length, randomNumberGenerator)_

Brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution.

~~~spl svg=A
let r = Sfc32(318402);
LsBrown(-1, 1, 1 / 100, 99, r)
.upToEnd
.linePlot
~~~

![](sw/spl/Help/Image/LsBrown-A.svg)

* * *

See also: LsBeta, LsCauchy, LsWhite

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbrown.html)

Categories: Stream
