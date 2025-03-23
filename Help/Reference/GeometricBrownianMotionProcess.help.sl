# GeometricBrownianMotionProcess

- _GeometricBrownianMotionProcess(μ, σ, x0)_

A `Type` representing a geometric Brownian motion process with drift μ,
volatility σ,
and initial value x0.

Simulate a geometric Brownian motion process:

~~~spl svg=A
let r = Sfc32(483152);
GeometricBrownianMotionProcess(0, 0.1, 2)
.randomFunction(r, [0 10 0.1], 1)
.linePlot
~~~

![](sw/spl/Help/Image/GeometricBrownianMotionProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(379582);
GeometricBrownianMotionProcess(0.3, 1, 1)
.randomFunction(r, [0 1 0.01], 4)
.linePlot
~~~

![](sw/spl/Help/Image/GeometricBrownianMotionProcess-B.svg)

Compare different σ values:

~~~spl svg=C
let r = Sfc32(675932);
[0.8, 1 .. 1.8].collect { :sigma |
	GeometricBrownianMotionProcess(
		1,
		sigma,
		23
	).randomFunction(r, [0 1 0.01], 1)
	.pathList
	.first
}.linePlot
~~~

![](sw/spl/Help/Image/GeometricBrownianMotionProcess-C.svg)

* * *

See also: LogNormalDistribution, OrnsteinUhlenbeckProcess, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/GeometricBrownianMotionProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Geometric_Brownian_motion)
