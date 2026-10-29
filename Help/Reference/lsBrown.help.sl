# lsBrown

- _lsBrown(low, high, step, length, r)_

Brownian motion between _low_ and _high_ with maximum step size _step_,
drawn from the random number generator _r_.
Steps have uniform distribution.

Brownian motion:

~~~spl svg=A
let r = Sfc32(318402);
lsBrown(-1, 1, 1 / 100, 99, r)
.upToEnd
.linePlot
~~~

![](Help/Image/lsBrown-A.svg)

* * *

See also: lsBeta, lsCauchy, lsWhite

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbrown.html)

Categories: Stream
