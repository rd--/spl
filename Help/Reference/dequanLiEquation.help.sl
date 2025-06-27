# dequanLiEquation

- _dequanLiEquation(a, c, d, e, k, f)_

The Dequan Li equation, a non-linear third-order differential equation.

Plot system:

~~~spl svg=A
let a = 40;
let c = 11 / 6;
let d = 0.16;
let e = 0.65;
let k = 55;
let f = 20;
dequanLiEquation(a, c, d, e, k, f)
.rungeKuttaMethod(
	[0.1 0.41 0.31],
	0, 2,
	0.0025
)
.second
.linePlot
~~~

![](sw/spl/Help/Image/dequanLiEquation-A.svg)

* * *

See also: aizawaEquation, rucklidgeEquation, rungeKuttaMethod

Guides: Chaotic Functions

References:
_Meier_
[1](http://www.3d-meier.de/tut19/Seite9.html)

Further Reading: Li 2007, Letellier and Gilmore 2008
