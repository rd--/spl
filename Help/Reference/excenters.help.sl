# excenters

- _excenters(t)_

Answer the excenters of the triangle _t_.

~~~spl svg=A
let t = [3 4 5].sssTriangle;
let c = t.excenters;
[t, c.PointCloud].LineDrawing
~~~

![](sw/spl/Help/Image/excenters-A.svg)

* * *

See also: excircles, exradii, incenter, Triangle

Guides: Geometry Functions, Triangle Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Excenter.html),
_W_
[1](https://en.wikipedia.org/wiki/Incircle_and_excircles)
