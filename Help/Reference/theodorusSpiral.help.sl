# theodorusSpiral

- _theodorusSpiral(n)_

Answer the first _n_ coordinates of the Theodorus spiral.

Plot spiral, with connecting radii:

~~~spl svg=A
let c = 17.theodorusSpiral;
let r = c.collect { :each |
	Line([[0 0], each])
};
[c.Line, r].LineDrawing
~~~

![](sw/spl/Help/Image/theodorusSpiral-A.svg)

Plot the first few terms at equal radii,
the angles exhibit the equidistribution property:

~~~pl svg=B
150.theodorusSpiral
.collect(normalize:/1)
.PointCloud
~~~

![](sw/spl/Help/Image/theodorusSpiral-B.svg)

* * *

See also: archimedeanSpiral, doyleSpiral, eulerSpiral, logarithmicSpiral, norwichSpiral, tractrixSpiral, sqrt

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/TheodorusSpiral.html),
_W_
[1](https://en.wikipedia.org/wiki/Spiral_of_Theodorus)

Further Reading: Davis 1993
