# lsBeta

- _lsBeta(low, high, p1, p2, length, randomNumberGenerator)_

Random values that follow a Beta distribution.

Biased low, line plot:

~~~spl svg=A
lsBeta(0, 1, 1 / 3, 3, 99, Sfc32(317984))
.upToEnd
.linePlot
~~~

![](Help/Image/lsBeta-A.svg)

Biased low, histogram plot:

~~~spl svg=B
lsBeta(0, 1, 1 / 3, 3, 999, Sfc32(681423))
.upToEnd
.histogramPlot
~~~

![](Help/Image/lsBeta-B.svg)

Biased high, line plot:

~~~spl svg=C
lsBeta(0, 1, 3, 1 / 3, 99, Sfc32(678142))
.upToEnd
.linePlot
~~~

![](Help/Image/lsBeta-C.svg)

* * *

See also: BetaDistribution, lsBrown, lsCauchy, lsRand, lsWhite

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pbeta.html)

Categories: Stream
