# CoxIngersollRossProcess

- _CoxIngersollRossProcess(μ, σ, θ, x0)_

A `Type` representing a Cox–Ingersoll–Ross process,
with long-term mean μ,
volatility σ,
speed of adjustment θ,
and initial condition x0.

Simulate a Cox–Ingersoll–Ross process:

~~~spl svg=A
let r = Sfc32(319812);
CoxIngersollRossProcess(0.3, 0.5, 1, 2)
.randomFunction(r, [0 1 0.01], 1)
.linePlot
~~~

![](sw/spl/Help/Image/CoxIngersollRossProcess-A.svg)

Simulate an ensemble of random paths for a Cox–Ingersoll–Ross process:

~~~spl svg=B
let r = Sfc32(189732);
CoxIngersollRossProcess(0.3, 0.5, 1, 2)
.randomFunction(r, [0 1 0.01], 3)
.linePlot
~~~

![](sw/spl/Help/Image/CoxIngersollRossProcess-B.svg)

* * *

See also: eulerMaruyamaMethod, GeometricBrownianMotionProcess, WienerProcess

Guides: Random Processes

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CoxIngersollRossProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Cox%E2%80%93Ingersoll%E2%80%93Ross_model)
