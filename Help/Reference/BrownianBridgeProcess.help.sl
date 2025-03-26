# BrownianBridgeProcess

- _BrownianBridgeProcess(σ, [t1, a], [t2, b])_

A `Type` representing the Brownian bridge process from value _a_ at time _t1_ to value _b_ at time _t2_ with volatility σ.

Simulate a Brownian bridge process pinned at `zero` at both ends:

~~~spl svg=A
let r = Sfc32(839357);
BrownianBridgeProcess(1, [0 0], [1 0])
.randomFunction(r, [0 1 0.01], 1)
.linePlot
~~~

![](sw/spl/Help/Image/BrownianBridgeProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(529721);
BrownianBridgeProcess(1, [0 -1], [2 1])
.randomFunction(r, [0 2 0.02], 3)
.linePlot
~~~

![](sw/spl/Help/Image/BrownianBridgeProcess-B.svg)

* * *

See also: eulerMaruyamaMethod, GeometricBrownianMotionProcess, NormalDistribution, OrnsteinUhlenbeckProcess, WienerProcess
