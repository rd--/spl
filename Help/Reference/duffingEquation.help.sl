# duffingEquation

- _duffingEquation(gamma, delta, omega)_

The Duffing equation, a non-linear second-order differential equation.
Answers a two argument `Block`,
accepting _t_ and _(x,y)_,
and answering _(x′,y′)_.

Period-five oscillation, γ=0.37, phase plot:

~~~spl svg=A
duffingEquation(0.37, 0.3, 1.2)
.rungeKuttaMethod([1 0], 0, 23, 0.1)
.second.linePlot
~~~

![](sw/spl/Help/Image/duffingEquation-A.svg)

Period-four oscillation, γ=0.29, phase plot:

~~~spl svg=B
duffingEquation(0.29, 0.3, 1.2)
.rungeKuttaMethod([1 0], 0, 17, 0.1)
.second.linePlot
~~~

![](sw/spl/Help/Image/duffingEquation-B.svg)

Period-four oscillation, γ=0.29, _f(t)_ plot:

~~~spl svg=C
let [t, v] = duffingEquation(0.29, 0.3, 1.2)
.rungeKuttaMethod([1 0], 0, 37, 0.1);
let [x, y] = v.downsample(2).transposed;
x.linePlot
~~~

![](sw/spl/Help/Image/duffingEquation-C.svg)

* * *

See also: duffingMap, rungeKuttaMethod, vanDerPolEquation

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DuffingDifferentialEquation.html),
_W_
[1](https://en.wikipedia.org/wiki/Duffing_equation)

Further Reading: Holmes 1976, Ueda 1979
