# expRand

- _expRand(r, a, b)_

Answer a random number logarithmically distrbuted between _a_ and _b_.

Historgram of random variate of ten-thousand places:

~~~spl svg=A
let r = Sfc32(678123);
(
	{
		r.expRand(23, 71)
	} ! 1E4
).histogramPlot
~~~

![](Help/Image/expRand-A.svg)

* * *

See also: exp, log, nextRandomFloat

Guides: Random Functions

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-exprand)
