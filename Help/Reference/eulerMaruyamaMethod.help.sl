# eulerMaruyamaMethod

- _eulerMaruyamaMethod(r, a₂, b₂, t, y0)_

Implement the Euler–Maruyama method for the approximate numerical solution of a stochastic differential equation where
_r_ is a random number generator,
_a_ and _b_ are functions of _y_ (or _x[t]_) and _t_,
_t_ is a time specification,
and _y0_ is the initial value.

Simulate an Ornstein–Uhlenbeck process:

~~~spl svg=A
let mu = 0;
let sigma = 0.1;
let theta = 0.3;
let r = Sfc32(678134);
let a = { :y :t | theta * (mu - y) };
let b = { :y :t | sigma };
let t = [0 10 0.1];
let y0 = 1;
eulerMaruyamaMethod(r, a:/2, b:/2, t, y0)
.transpose
.linePlot
~~~

![](sw/spl/Help/Image/eulerMaruyamaMethod-A.svg)

Simulate a geometric brownian motion process:

~~~spl svg=B
let mu = 0;
let sigma = 0.1;
let r = Sfc32(317892);
let a = { :y :t | mu * y };
let b = { :y :t | sigma * y };
let t = [0 10 0.1];
let y0 = 2;
eulerMaruyamaMethod(r, a:/2, b:/2, t, y0)
.transpose
.linePlot
~~~

![](sw/spl/Help/Image/eulerMaruyamaMethod-B.svg)

Simulate a brownian bridge process:

~~~spl svg=C
Sfc32(529721)
.eulerMaruyamaMethod(
	{ :y :t | (1 - y) / (2 - t) },
	{ :y :t | 1 },
	[0 2 0.01],
	-1
).transpose.linePlot
~~~

![](sw/spl/Help/Image/eulerMaruyamaMethod-C.svg)

* * *

See also: BrownianBridgeProcess, GeometricBrownianMotionProcess, milsteinMethod, OrnsteinUhlenbeckProcess

Guides: Numerical Methods, Random Processes

References:
_W_
[1](https://en.wikipedia.org/wiki/Euler%E2%80%93Maruyama_method)

Further Reading: Maruyama 1955
