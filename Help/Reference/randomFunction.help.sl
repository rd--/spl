# randomFunction

- _randomFunction(p, t, n, r)_

Answer a `TemporalData` value representing a pseudorandom function in
_n_ dimensions
from the process _p_
over time period _t_,
specified as _(min, max, step?)_,
utilising the random number generator _r_.

RandomFunction an ensemble of twenty-three Wiener processes:

~~~spl svg=A
WienerProcess(0, 0.5)
.randomFunction(
	[0 1 0.05],
	23,
	Sfc32(990914)
)
.linePlot
~~~

![](sw/spl/Help/Image/randomFunction-A.svg)

* * *

See also: randomVariate, TemporalData, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomFunction.html)
