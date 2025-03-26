# FractionalBrownianMotionProcess

- _FractionalBrownianMotionProcess(h)_

A `Type` representing fractional Brownian motion process with Hurst index _h_.

Simulate a fractional Brownian motion process:

~~~spl svg=A
let r = Sfc32(781232);
FractionalBrownianMotionProcess(0.3)
.randomFunction(r, [0, 1, 0.01], 1)
.linePlot
~~~

![](sw/spl/Help/Image/FractionalBrownianMotionProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(891735);
FractionalBrownianMotionProcess(0.3)
.randomFunction(r, [0, 10, 0.1], 4)
.linePlot
~~~

![](sw/spl/Help/Image/FractionalBrownianMotionProcess-B.svg)

With a larger Hurst index:

~~~spl svg=C
let r = Sfc32(867213);
FractionalBrownianMotionProcess(0.7)
.randomFunction(r, [0, 10, 0.1], 3)
.linePlot
~~~

![](sw/spl/Help/Image/FractionalBrownianMotionProcess-C.svg)

* * *

See also: GeometricBrownianMotionProcess, hoskingMethod, NormalDistribution, OrnsteinUhlenbeckProcess, RandomWalkProcess, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FractionalBrownianMotionProcess.html)
_W_
[1](https://en.wikipedia.org/wiki/Fractional_Brownian_motion)
