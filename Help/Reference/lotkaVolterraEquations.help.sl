# lotkaVolterraEquations

- _lotkaVolterraEquations(α, β, γ, δ)_

Implements the Lotka-Volterra equations,
which describe an ecological predator-prey (or parasite-host) model.
Constants are:

- α: growth rate of prey
- β: rate of predatation
- γ: death rate of predators
- δ: rate of predator increase

Plot _x_ (prey) and _y_ (predator):

~~~spl svg=A
lotkaVolterraEquations(1.5, 1, 3, 1)
.rungeKuttaMethod(
	[10 5],
	0, 20,
	0.1
)
.second
.transposed
.linePlot
~~~

![](sw/spl/Help/Image/lotkaVolterraEquations-A.svg)

Plot with unit constants:

~~~spl svg=B
lotkaVolterraEquations(1, 1, 1, 1)
.rungeKuttaMethod(
	[3 6],
	0, 40,
	0.1
)
.second
.transposed
.linePlot
~~~

![](sw/spl/Help/Image/lotkaVolterraEquations-B.svg)

Plot phase diagrams,
varying initial _y_:

~~~spl svg=C
[1 2 5 7 10].collect { :y0 |
	lotkaVolterraEquations(1.1, 0.4, 0.4, 0.1)
	.rungeKuttaMethod(
		[10 y0],
		0, 15,
		0.1
	)
	.second
}
.linePlot
~~~

![](sw/spl/Help/Image/lotkaVolterraEquations-C.svg)

* * *

See also: arneodoEquation, coulletEquation, rungeKuttaMethod

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Lotka-VolterraEquations.html),
_W_
[1](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations)
