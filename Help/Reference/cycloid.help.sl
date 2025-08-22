# cycloid

- _cycloid(r)_

Answer the cycloid curve with radius _r_.

Plot:

~~~spl svg=A
(0 -- 2.pi).functionPlot(
	cycloid(1)
)
~~~

![](sw/spl/Help/Image/cycloid-A.svg)

Plot varying _r_:

~~~spl svg=B
(0 -- 2.pi).functionPlot(
	(1 / [1 .. 5]).collect(cycloid:/1)
)
~~~

![](sw/spl/Help/Image/cycloid-B.svg)

Drawing:

~~~spl svg=C
[
	Circle([0 1], 1),
	Line([0 0; 0 1]),
	Line([0 0; 2.pi 0]),
	Circle([1.pi 0], 1.pi),
	(0 -- 2.pi).discretize(50,
		cycloid(1)
	).PointCloud
].LineDrawing
~~~

![](sw/spl/Help/Image/cycloid-C.svg)

* * *

See also: Circle, cos, epicycloid, hypocycloid, sin, trochoid

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cycloid.html)
_W_
[1](https://en.wikipedia.org/wiki/Cycloid)
