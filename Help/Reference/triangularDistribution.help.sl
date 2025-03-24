# triangularDistribution

- _triangularDistribution(r, min, max, c)_

A symmetric triangular statistical distribution giving values between ⌊ and ⌈,
with mode at _c_.

~~~spl svg=A
let r = Sfc32(378141);
(
	{
		r.triangularDistribution(-1, 1, 0)
	} ! 99
).linePlot
~~~

![](sw/spl/Help/Image/triangularDistribution-A.svg)

* * *

See also: Random, nextRandomFloat
