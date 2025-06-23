# sinusoidalSpiral

- _sinusoidalSpiral(n, a=1)_

Curve studied by Maclaurin in 1718.

At _n=1_, a circle:

~~~spl svg=A
(0 -- 1.pi).discretize(
	100,
	sinusoidalSpiral(1, 1)
).Line
~~~

![](sw/spl/Help/Image/sinusoidalSpiral-A.svg)

At _n=3_, the Kiepert curve:

~~~spl svg=B
(0.pi -- 2.pi).discretize(
	100,
	sinusoidalSpiral(3, 1)
).Line
~~~

![](sw/spl/Help/Image/sinusoidalSpiral-B.svg)

* * *

See also: tschirnhausenCubic

Guides: Curve Functions

References:
_Ferréol_
[1](https://mathcurve.com/courbes2d.gb/spiralesinusoidale/spiralesinusoidale.shtml)
[2](https://mathcurve.com/courbes2d.gb/kiepert/kiepert.shtml),
_Mathematica_
[1](https://mathworld.wolfram.com/SinusoidalSpiral.html),
_W_
[1](https://en.wikipedia.org/wiki/Sinusoidal_spiral)

