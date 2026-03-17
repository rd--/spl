# tractrixSpiral

- _tractrixSpiral(a)_

A spiral,
also known as the polar tractrix or complicated tractrix,
studied by Huygens and Varignon in 1704.

~~~spl svg=A
let f:/1 = tractrixSpiral(1);
(0 -- 1.5275.log).subdivide(500)
.collect { :t |
	f(t.exp)
}.Line
~~~

![](Help/Image/tractrixSpiral-A.svg)

* * *

See also: syntractrix, tractrix

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/spiraletractrice/spiraletractrice.shtml),
_Mathematica_
[1](https://mathworld.wolfram.com/TractrixSpiral.html)
