# rucklidgeEquation

- _rucklidgeEquation(k, a)_

Implement the non-linear third-order differential equation devised by Alastair Michael Rucklidge in 1992.

Plot system:

~~~spl svg=A
rucklidgeEquation(2, 6.7)
.rungeKuttaMethod(
	[0.1 0.41 0.31],
	0, 63,
	0.1
)
.second
.linePlot
~~~

![](sw/spl/Help/Image/rucklidgeEquation-A.svg)

* * *

See also: aizawaEquation, dequanLiEquation, rungeKuttaMethod

Guides: Chaotic Functions

References:
_Meier_
[1](http://www.3d-meier.de/tut19/Seite17.html)
