# lorenzEquation

- _lorenzEquation(rho, sigma, beta)_

The Lorenz ordinary differential equation.
Answers a two argument `Block`,
accepting _t_ and _(x,y,z)_,
and answering _(x′,y′,z′)_.

Plot of _(x,y)_ for a small iteration count:

~~~spl svg=A
let [t, v] = lorenzEquation(28, 10, 8 / 3)
.rungeKuttaMethod([10 10 10], 0, 5, 0.01);
let [x, y, z] = v.transposed;
[x, y].transposed.scatterPlot
~~~

![](sw/spl/Help/Image/lorenzEquation-A.svg)

* * *

See also: duffingEquation, vanDerPolEquation

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/LorenzEquations.html),
_W_
[1](https://en.wikipedia.org/wiki/Lorenz_system)
