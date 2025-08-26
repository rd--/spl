# henonHeilesEquation

- _henonHeilesEquation(λ=1)_

Answer the Hénon-Heiles equation for the specified λ,
ordinarily `one`.
The vector is _(x,y,px,py)_.

Plot _y/py_ for _t=(0,50)_:

~~~spl svg=A
let [t, v] =
henonHeilesEquation(1)
.rungeKuttaMethod(
	[1/6 ^ 1/2, 0, 0, 0],
	0, 50, 0.1
);
let [x, y, px, py] = v.transpose;
[y py].transpose.linePlot
~~~

![](sw/spl/Help/Image/henonHeilesEquation-A.svg)

* * *

See also: lorenzEquation

Guides: Chaotic Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Henon-HeilesEquation.html),
_W_
[1](https://en.wikipedia.org/wiki/H%C3%A9non%E2%80%93Heiles_system)
