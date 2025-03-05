# vanDerPolEquation

- _vanDerPolEquation(mu)_

The van der Pol equation, a second-order ordinary differential equation.
Answers a two argument `Block`,
accepting _t_ and _(x,y)_,
and answering _(x′,y′)_.

Phase plot of the van der Pol equation with μ=0.5:

~~~spl svg=A
vanDerPolEquation(0.5)
.rungeKuttaMethod([2 0], 0, 7, 0.05)
.second.linePlot
~~~

![](sw/spl/Help/Image/vanDerPolEquation-A.svg)

Phase plot of the van der Pol equation with μ=2.3:

~~~spl svg=B
vanDerPolEquation(2.3)
.rungeKuttaMethod([2 0], 0, 9, 0.05)
.second.linePlot
~~~

![](sw/spl/Help/Image/vanDerPolEquation-B.svg)

_f(t)_ plot of the van der Pol equation with μ=3.7:

~~~spl svg=C
let [t, v] = vanDerPolEquation(3.7)
.rungeKuttaMethod([1 0], 0, 47, 0.1);
let [x, y] = v.downsample(2).transposed;
x.linePlot
~~~

![](sw/spl/Help/Image/vanDerPolEquation-C.svg)

* * *

See also: duffingEquation, rungeKuttaMethod

References:
_Mathematica_
[1](https://mathworld.wolfram.com/vanderPolEquation.html),
_W_
[1](https://en.wikipedia.org/wiki/Van_der_Pol_oscillator)
