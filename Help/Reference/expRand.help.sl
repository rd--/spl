# expRand

- _expRand(r, a, b)_

Answer a random number logarithmically distrbuted between _a_ and _b_.

~~~
let r = Sfc32(678123);
(
	{
		r.expRand(23, 71)
	} ! 1E4
).histogramPlot
~~~

![](sw/spl/Help/Image/expRand-A.svg)

* * *

See also: exp, log, nextRandomFloat

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/SimpleNumber.html#-exprand)
