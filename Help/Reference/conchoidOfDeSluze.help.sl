# conchoidOfDeSluze

- _conchoidOfDeSluze(a)_

Answer the conchoid of de Sluze, a cubic curve first constructed by René de Sluze in 1662.
At _a=0_ a line,
at _a=-1_ the cissoid of Diocles,
at _a=−2_ the right strophoid,
at _a=−4_ the trisectrix of Maclaurin.

Plot for various _a_:

~~~spl svg=A
(-1.35 -- 1.35).functionPlot(
	[-4 -3 -2 -1 -0.5 0 1 2 3].collect(
		conchoidOfDeSluze:/1
	)
)
~~~

![](sw/spl/Help/Image/conchoidOfDeSluze-A.svg)

* * *

See also: cissoidOfDiocles, cos, sec, trisectrixOfMaclaurin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ConchoidofdeSluze.html),
_W_
[1](https://en.wikipedia.org/wiki/Conchoid_of_de_Sluze)
