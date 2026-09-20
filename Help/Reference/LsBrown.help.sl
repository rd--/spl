# LsBrown

- _LsBrown(low, high, step, length, r)_

Brownian motion between _low_ and _high_ with maximum step size _step_,
drawn from the random number generator _r_.
Steps have uniform distribution.

Brownian motion:

~~~spl svg=A
let r = Sfc32(318402);
LsBrown(-1, 1, 1 / 100, 99, r)
.upToEnd
.linePlot
~~~

![](Help/Image/LsBrown-A.svg)

* * *

See also: LsBeta, LsCauchy, LsWhite

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbrown.html)

Categories: Stream
