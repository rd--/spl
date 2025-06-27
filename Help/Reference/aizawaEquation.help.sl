# aizawaEquation

- _aizawaEquation(a, b, c, d, e, f)_

The Aizawa equation, a non-linear third-order differential equation.

Plot system:

~~~spl svg=A
let a = 0.95;
let b = 0.7;
let c = 0.6;
let d = 3.5;
let e = 0.25;
let f = 0.1;
aizawaEquation(a, b, c, d, e, f)
.rungeKuttaMethod(
	[0.1 0 0],
	0, 30,
	0.05
)
.second
.linePlot
~~~

![](sw/spl/Help/Image/aizawaEquation-A.svg)

* * *

See also: rucklidgeEquation, rungeKuttaMethod

Guides: Chaotic Functions

References:
_Meier_
[1](http://www.3d-meier.de/tut19/Seite3.html)

Further Reading: Langford 1984
