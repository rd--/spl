# syntractrix

- _syntractrix(a, k)_

Answer the syntractrix curve.

Plot at _k=1/4,1/2,1,3/2_:

~~~spl svg=A
(-1.pi -- 1.pi).functionPlot(
	[0.25 0.5 1 1.5].collect { :k |
		syntractrix(1, k)
	}
)
~~~

![](sw/spl/Help/Image/syntractrix-A.svg)

Plot at _k=1,2,3,7_:

~~~spl svg=B
(-3.pi -- 3.pi).functionPlot(
	[1 2 3 7].collect { :k |
		syntractrix(1, k)
	}
)
~~~

![](sw/spl/Help/Image/syntractrix-B.svg)

* * *

See also: cosh, tanh, tractrix, tractrixSpiral

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/syntractrice/syntractrice.shtml),
_W_
[1](https://en.wikipedia.org/wiki/Syntractrix)
