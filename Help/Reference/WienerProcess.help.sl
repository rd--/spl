# WienerProcess

- _WienerProcess(mu, sigma)_

A `Type` that represents a Wiener process with a drift μ and volatility σ.
The process can be reset using `reset`,
the next value can be retrieved using `nextRandom`.

Simulate a Wiener process:

~~~spl svg=A
let r = Sfc32(693718);
WienerProcess(0, 0.5)
.randomFunction(r, [0 1 0.01], 1)
.linePlot
~~~

![](sw/spl/Help/Image/WienerProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(990914);
WienerProcess(0, 0.5)
.randomFunction(r, [0 1 0.01], 4)
.linePlot
~~~

![](sw/spl/Help/Image/WienerProcess-B.svg)

Simulate a Wiener process in three dimensions:

~~~spl svg=C
let r = Sfc32(990914);
WienerProcess(0, 1)
.randomFunction(r, [0 1 0.005], 3)
.valueList
.transposed
.linePlot
~~~

![](sw/spl/Help/Image/WienerProcess-C.svg)

* * *

See also: GeometricBrownianMotionProcess, NormalDistribution, OrnsteinUhlenbeckProcess, randomFunction, RandomWalkProcess

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WienerProcess.html)
[2](https://reference.wolfram.com/language/ref/WienerProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Wiener_process)
