# pendulumEquation

- _pendulumEquation(g=1, l=1, m=1, b=0.5, a=0.5, k=1)_

Model a damped, driven pendulum.
The pendulum equation is a non-linear second-order differential equation.

_g_ tells the gravitational constant,
_l_ tells the length of the pendulum,
_m_ tells the mass of the pendulum,
_b_ tells the damping constant,
_a_ tells the amplitude of the driving force,
and _k_ tells the frequency of driving force.

Plot time-sequence of θ of a simple damped oscillator:

~~~spl svg=A
pendulumEquation(1, 1, 1, 0.15, 0, 1)
.rungeKuttaMethod(
	[1/2.pi, 0],
	0, 30,
	0.05
).second
.collect(first:/1)
.downsample(2)
.linePlot
~~~

![](sw/spl/Help/Image/pendulumEquation-A.svg)

Plot time-sequence of `sin` of θ of a chaotic set of parameters:

~~~spl svg=B
pendulumEquation(1, 1, 1, 0.5, 1.5, 2 / 3)
.rungeKuttaMethod(
	[0, 0],
	0, 75,
	0.025
).second
.collect { :v |
	let [theta, _] = v;
	theta.sin
}.downsample(4)
.linePlot
~~~

![](sw/spl/Help/Image/pendulumEquation-B.svg)

* * *

See also: doublePendulumEquation, rungeKuttaMethod

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DampedSimpleHarmonicMotion.html),
_W_
[1](https://en.wikipedia.org/wiki/Pendulum_(mechanics))
