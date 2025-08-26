# rosslerEquation

- _rosslerEquation(a, b, c)_

The Rössler ordinary differential equation.
Answers a two argument `Block`,
accepting _t_ and _(x,y,z)_,
and answering _(x′,y′,z′)_.

Plot of _(x,y,z)_ for _t_ in _(0,25)_:

~~~spl svg=A
rosslerEquation(0.2, 0.2, 8)
.rungeKuttaMethod([1 1 1], 0, 25, 0.05)
.second
.linePlot
~~~

![](sw/spl/Help/Image/rosslerEquation-A.svg)

Plot of _x_ over _t_ in _(0,50)_ for the same initial conditions:

~~~spl svg=B
let [t, v] = rosslerEquation(0.2, 0.2, 8)
.rungeKuttaMethod([1 1 1], 0, 50, 0.05);
let [x, y, z] = v.transpose;
x.linePlot
~~~

![](sw/spl/Help/Image/rosslerEquation-B.svg)

* * *

See also: duffingEquation, lorenzEquation, vanDerPolEquation

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RoesslerAttractor.html),
_W_
[1](https://en.wikipedia.org/wiki/R%C3%B6ssler_attractor)
