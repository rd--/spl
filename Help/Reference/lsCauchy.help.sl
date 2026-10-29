# lsCauchy

- _lsCauchy(mean, spread, length, r)_

Random values that follow a Cauchy distribution.

Random variate folling Cauchy distribution:

~~~spl svg=A
let r = Sfc32(280142);
lsCauchy(0, 1 / 9, 99, r)
.upToEnd
.linePlot
~~~

![](Help/Image/lsCauchy-A.svg)

* * *

See also: CauchyDistribution, lsBeta, lsBrown, lsWhite

Guides: Patterns and Streams

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Pcauchy.html)

Categories: Stream
