# LsIBrown

- _LsIBrown(low, high, step, length)_

Integer brownian motion between _low_ and _high_ with maximum step size _step_.
Steps have uniform distribution, and exclude the possibility of a zero step.

~~~spl svg=A
LsIBrown(1, 99, 3, 99).upToEnd.linePlot
~~~

![](sw/spl/Help/Image/LsIBrown-A.svg)

* * *

See also: LsBrown

Categories: Stream
