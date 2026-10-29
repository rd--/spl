# lsIBrown

- _lsIBrown(low, high, step, length, r)_

Integer brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution, and exclude the possibility of a zero step.

Integer brownian motion:

~~~spl svg=A
let r = Sfc32(789143);
lsIBrown(1, 99, 3, 99, r)
.upToEnd
.linePlot
~~~

![](Help/Image/lsIBrown-A.svg)

* * *

See also: lsBrown

Guides: Patterns and Streams

Categories: Stream
