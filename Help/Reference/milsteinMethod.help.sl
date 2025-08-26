# milsteinMethod

- _milsteinMethod(r, a₁, b₁, c₁, t, y0)_

Implement the Milstein method for the approximate numerical solution of a stochastic differential equation where
_r_ is a random number generator,
_a_, _b_ and _c_ are functions of _y_ (or _x[t]_),
_t_ is a time specification,
and _y0_ is the initial value.

Simulate a geometric brownian motion process:

~~~spl svg=A
let mu = 0;
let sigma = 0.1;
let r = Sfc32(317892);
let a = { :y | mu * y };
let b = { :y | sigma * y};
let c = { :y | sigma.squared / 2 * y };
let t = [0 10 0.1];
let y0 = 2;
milsteinMethod(r, a:/1, b:/1, c:/1, t, y0)
.transpose
.linePlot
~~~

![](sw/spl/Help/Image/milsteinMethod-A.svg)

Simulate a stochastic differential equation:

~~~spl svg=B
Sfc32(317892)
.milsteinMethod(
	{ :y | y.- },
	{ :y | (1 + y.squared).sqrt },
	{ :y | y },
	[0 5 0.02],
	1
).transpose.linePlot
~~~

![](sw/spl/Help/Image/milsteinMethod-B.svg)

* * *

See also: eulerMaruyamaMethod, GeometricBrownianMotionProcess

Guides: Random Processes

References:
_W_
[1](https://en.wikipedia.org/wiki/Milstein_method)

Further Reading: Mil’shtejn 1975
