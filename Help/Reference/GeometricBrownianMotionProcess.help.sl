# GeometricBrownianMotionProcess

- _GeometricBrownianMotionProcess(μ, σ, x0)_

A `Type` representing a geometric Brownian motion process with drift μ,
volatility σ,
and initial value x0.

Simulate a geometric Brownian motion process:

```
>>> let r = Sfc32(567214);
>>> GeometricBrownianMotionProcess(
>>> 	0, 1 / 3, 1 / 4
>>> ).randomFunction(r, [0 1 0.25], 1)
>>> .pathList[1]
[
	0.00 0.25000;
	0.25 0.24576;
	0.50 0.32671;
	0.75 0.28211;
	1.00 0.23979
]
```

Simulate and plot a geometric Brownian motion process:

~~~spl svg=A
let r = Sfc32(483152);
GeometricBrownianMotionProcess(
	0, 0.1, 2
).randomFunction(r, [0 10 0.1], 1)
.linePlot
~~~

![](sw/spl/Help/Image/GeometricBrownianMotionProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(379582);
GeometricBrownianMotionProcess(
	0.3, 1, 1
).randomFunction(r, [0 1 0.01], 4)
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
