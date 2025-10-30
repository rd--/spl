# umbilicTorus

- _umbilicTorus(a, b)_

Answer the parametric equation for the umbilic torus.

~~~spl svg=A
(-1.pi -- 1.pi).surfacePlot { :u :v |
	let [x, y, z] = umbilicTorus(u, v);
	[x, z, y]
}
~~~

![](sw/spl/Help/Image/umbilicTorus-A.svg)

* * *

See also: torus

Guides: Surface Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Umbilic_torus)
