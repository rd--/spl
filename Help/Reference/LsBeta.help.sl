# LsBeta

- _LsBeta(low, high, p1, p2, length)_

Random values that follow an Eulerian Beta distribution.

Biased low, line plot:

~~~
LsBeta(0, 1, 1 / 3, 3, 99).upToEnd.linePlot
~~~

Biased low, histogram plot:

~~~
LsBeta(0, 1, 1 / 3, 3, 999).upToEnd.histogramList.second.discretePlot
~~~

Biased high, line plot:

~~~
LsBeta(0, 1, 3, 1 / 3, 99).upToEnd.linePlot
~~~

* * *

See also: LsWhite

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbeta.html)

Categories: Stream
