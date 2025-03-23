# GeometricBrownianMotionProcess

- _GeometricBrownianMotionProcess(μ, σ, x0)_

A `Type` representing a geometric Brownian motion process with drift μ,
volatility σ,
and initial value x0.

Simulate a geometric Brownian motion process:

~~~spl svg=A
GeometricBrownianMotionProcess(0, 0.1, 2)
.simulate([0 10 0.1], 1, Sfc32(483152))
.linePlot
~~~

![](sw/spl/Help/Image/GeometricBrownianMotionProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
GeometricBrownianMotionProcess(0.3, 1, 1)
.simulate([0 1 0.01], 4, Sfc32(379582))
.linePlot
~~~

![](sw/spl/Help/Image/GeometricBrownianMotionProcess-B.svg)

* * *

See also: LogNormalDistribution, OrnsteinUhlenbeckProcess, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GeometricBrownianMotionProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Geometric_Brownian_motion)
