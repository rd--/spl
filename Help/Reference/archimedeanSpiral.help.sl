# archimedeanSpiral

- _archimedeanSpiral(a=1, n)_

A family of spirals given by _r=aθ^1/n_.

With _n=1_, called Archimedes’ spiral:

~~~spl svg=A
(0 -- 9.pi).functionPlot(
	200,
	archimedeanSpiral(1, 1)
)
~~~

![](sw/spl/Help/Image/archimedeanSpiral-A.svg)

With _n=2_, called Fermat’s spiral, or the parabolic spiral:

~~~spl svg=B
(0 -- 9.pi).functionPlot(
	200,
	archimedeanSpiral(1, 2)
)
~~~

![](sw/spl/Help/Image/archimedeanSpiral-B.svg)

With _n=-1_, called the hyperbolic spiral, or the inverse spiral:

~~~spl svg=C
(1.pi -- 9.pi).functionPlot(
	200,
	archimedeanSpiral(1, -1)
)
~~~

![](sw/spl/Help/Image/archimedeanSpiral-C.svg)

With _n=-2_, called the lituus:

~~~spl svg=D
(1/27.pi -- 9.pi).functionPlot(
	200,
	archimedeanSpiral(1, -2)
)
~~~

![](sw/spl/Help/Image/archimedeanSpiral-D.svg)

* * *

See also: ^, cos, sin

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ArchimedeanSpiral.html)
[2](https://mathworld.wolfram.com/ArchimedesSpiral.html)
[3](https://mathworld.wolfram.com/FermatsSpiral.html)
[4](https://mathworld.wolfram.com/HyperbolicSpiral.html)
[5](https://mathworld.wolfram.com/Lituus.html),
_W_
[1](https://en.wikipedia.org/wiki/Spiral)
[2](https://en.wikipedia.org/wiki/Archimedean_spiral)
[3](https://en.wikipedia.org/wiki/Fermat%27s_spiral)
[4](https://en.wikipedia.org/wiki/Lituus_(mathematics))
