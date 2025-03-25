# randomFunction

- _randomFunction(p, r, t, n)_

Answer a `TemporalData` value representing a pseudo-random function in
_n_ dimensions
from the process _p_
over time period _t_,
specified as either _(min, max)_ or _(min, max, step)_,
utilising the random number generator _r_.

Simulate an ensemble of twenty-three Wiener processes:

~~~spl svg=A
let r = Sfc32(990914);
WienerProcess(0, 0.5)
.randomFunction(r, [0 1 0.05], 23)
.linePlot
~~~

![](sw/spl/Help/Image/randomFunction-A.svg)

* * *

See also: randomVariate, TemporalData, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/RandomFunction.html)
