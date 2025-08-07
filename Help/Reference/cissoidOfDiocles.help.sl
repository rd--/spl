# cissoidOfDiocles

- _cissoidOfDiocles(a)_

Answer the cissoid of Diocles,
a cubic curve by Diocles, 180 BCE.

Plot curve and generating circle:

~~~spl svg=A
let t = (-1/3.pi -- 1/3.pi).discretize(100);
[
	Circle([1 0], 1),
	Line(t.collect(cissoidOfDiocles(1)))
].LineDrawing
~~~

![](sw/spl/Help/Image/cissoidOfDiocles-A.svg)

* * *

See also: strophoid, tan

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CissoidofDiocles.html),
_W_
[1](https://en.wikipedia.org/wiki/Cissoid_of_Diocles)
