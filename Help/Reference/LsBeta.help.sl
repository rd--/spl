# LsBeta

- _LsBeta(low, high, p1, p2, length, randomNumberGenerator)_

Random values that follow an Eulerian Beta distribution.

Biased low, line plot:

~~~spl svg=A
LsBeta(0, 1, 1 / 3, 3, 99, Sfc32(317984))
.upToEnd
.linePlot
~~~

![](sw/spl/Help/Image/LsBeta-A.svg)

Biased low, histogram plot:

~~~spl svg=B
LsBeta(0, 1, 1 / 3, 3, 999, Sfc32(681423))
.upToEnd
.histogramList
.second
.discretePlot
~~~

![](sw/spl/Help/Image/LsBeta-B.svg)

Biased high, line plot:

~~~spl svg=C
LsBeta(0, 1, 3, 1 / 3, 99, Sfc32(678142))
.upToEnd
.linePlot
~~~

![](sw/spl/Help/Image/LsBeta-C.svg)

* * *

See also: LsBrown, LsCauchy, LsRand, LsWhite

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbeta.html)

Categories: Stream
