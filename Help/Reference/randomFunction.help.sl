# randomFunction

- _randomFunction(r, p, t, n)_

Answer a `TemporalData` value representing a pseudorandom function in
_n_ dimensions
from the process _p_
over time period _t_,
specified as _(min, max, step)_,
utilising the random number generatror _r_.

Simulate an ensemble of twenty-three Wiener processes:

~~~spl svg=A
Sfc32(990914).randomFunction(
	WienerProcess(0, 0.5),
	[0 1 0.05],
	23
).linePlot
~~~

![](sw/spl/Help/Image/randomFunction-A.svg)

* * *

See also: TemporalData, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomFunction.html)
