# LsBrown

- _LsBrown(low, high, step, length)_

Brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution.

~~~
LsBrown(-1, 1, 1 / 100, 99).upToEnd.linePlot
~~~

* * *

See also: LsWhite

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbrown.html)
