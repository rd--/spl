# limacon

- _limacon(a, b)_

Answer the limacon curve.

Plot at _b=1/2,3/2,5/2_:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	[0.5 1.5 2.5].collect { :b |
		limacon(1, b)
	}
)
~~~

![](sw/spl/Help/Image/limacon-A.svg)

* * *

See also: cos, epitrochoid, trochoid

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Limacon.html),
_W_
[1](https://en.wikipedia.org/wiki/Limaçon)
