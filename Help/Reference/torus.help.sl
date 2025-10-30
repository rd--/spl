# torus

- _torus(r)_

Answer the parametric equation for the torus.

~~~spl svg=A
let f:/2 = torus(2.5);
(0 -- 2.pi).surfacePlot { :u :v |
	let [x, y, z] = f(u, v);
	[x, z, y]
)
~~~

![](sw/spl/Help/Image/torus-A.svg)

* * *

See also: umbilicTorus

Guides: Surface Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Torus.html),
_W_
[1](https://en.wikipedia.org/wiki/Torus)
