# OrnsteinUhlenbeckProcess

- _OrnsteinUhlenbeckProcess(μ, σ, θ, x0)_

A `Type` that represents a stationary Ornstein–Uhlenbeck process with long-term mean μ,
volatility sigma,
mean reversion speed θ,
and initial condition x0.

Simulate an Ornstein–Uhlenbeck process:

~~~spl svg=A
let r = Sfc32(631784);
OrnsteinUhlenbeckProcess(0, 0.1, 0.3, 1)
.randomFunction(r, [0 20 0.1], 1)
.linePlot
~~~

![](sw/spl/Help/Image/OrnsteinUhlenbeckProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(735923);
OrnsteinUhlenbeckProcess(0.3, 0.5, 0.4)
.randomFunction(r, [0 1 0.01], 4)
.linePlot
~~~

![](sw/spl/Help/Image/OrnsteinUhlenbeckProcess-B.svg)

* * *

See also: eulerMaruyamaMethod, NormalDistribution, WienerProcess

Guides: Random Processes

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/OrnsteinUhlenbeckProcess.html),
_W_
[1](https://en.wikipedia.org/wiki/Ornstein%E2%80%93Uhlenbeck_process)
