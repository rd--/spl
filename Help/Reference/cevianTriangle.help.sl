# cevianTriangle

- _cevianTriangle(t, p)_

Answer the Cevian triangle of the triangle _t_ given the point _p_.

An acute triangle, an interior point, and the associated Cevian triangle:

~~~spl svg=A
let a = [5 4 5].sssTriangle;
let b = [2 2];
let c = a.cevianTriangle(b);
let d = c.vertexCoordinates;
let e = d.collect { :x | Line([b, x]) };
[a, Point(b), c, e].LineDrawing
~~~

![](sw/spl/Help/Image/cevianTriangle-A.svg)

* * *

See also: pedalTriangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CevianTriangle.html)
