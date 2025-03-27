# hoskingMethod

- _hoskingMethod(r, t, m, h, k)_

Simulate fractional Gaussian noise or fractional Brownian motion using the Hosking method,
_r_ is a random number generator,
the simulation is over the time interval _(0, t)_,
_m_ specifies the size of the sample to be _2 ^ m_,
and _h_ is the Hurst parameter of the trace in _(0, 1)_.
If _k_ is true simulates fractional Brownian motion,
else fractional Gaussian noise.

A _2^7_ place trace of fractional Brownian motion with _h_ of 0.9:

~~~spl svg=A
Sfc32(278193)
.hoskingMethod(1, 7, 0.9, true)
.linePlot
~~~

![](sw/spl/Help/Image/hoskingMethod-A.svg)

The same trace of fractional Gaussian noise:

~~~spl svg=B
Sfc32(278193)
.hoskingMethod(1, 7, 0.9, false)
.linePlot
~~~

![](sw/spl/Help/Image/hoskingMethod-B.svg)

Mean of sample of fractional Gaussian noise,
the predicted value is `zero`:

```
>>> Sfc32(378219)
>>> .hoskingMethod(1, 8, 0.5, false)
>>> .mean
-0.0015106
```

* * *

See also: FractionalBrownianMotionProcess, FractionalGaussianNoiseProcess

Further Reading: Hosking 1984
