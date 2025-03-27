# FractionalGaussianNoiseProcess

- _FractionalGaussianNoiseProcess(h)_

A `Type` representing fractional Gaussian noise process with Hurst index _h_.

Simulate a fractional Gaussian noise process:

~~~spl svg=A
let r = Sfc32(781232);
FractionalGaussianNoiseProcess(0.4)
.randomFunction(r, [0 100 1], 1)
.linePlot
~~~

![](sw/spl/Help/Image/FractionalGaussianNoiseProcess-A.svg)

Simulate an ensemble of paths:

~~~spl svg=B
let r = Sfc32(793218);
FractionalGaussianNoiseProcess(0.4)
.randomFunction(r, [0 100 1], 2)
.linePlot
~~~

![](sw/spl/Help/Image/FractionalGaussianNoiseProcess-B.svg)

With a larger Hurst index:

~~~spl svg=C
let r = Sfc32(372107);
FractionalGaussianNoiseProcess(0.9)
.randomFunction(r, [0 100 1], 2)
.linePlot
~~~

![](sw/spl/Help/Image/FractionalGaussianNoiseProcess-C.svg)

* * *

See also: BrownianBridgeProcess, FractionalBrownianMotionProcess, GeometricBrownianMotionProcess, hoskingMethod, NormalDistribution, OrnsteinUhlenbeckProcess, RandomWalkProcess, WienerProcess

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/FractionalGaussianNoiseProcess.html)
_W_
[1](https://en.wikipedia.org/wiki/Fractional_Brownian_motion)
