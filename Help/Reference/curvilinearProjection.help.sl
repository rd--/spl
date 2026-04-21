# curvilinearProjection

- _curvilinearProjection([x y z], r=1)_

Answer the curvilinear projection of the Cartesian coordinates _x,y,z_ using a sphere of radius _r_.
Curvilinear perspective is also called five-point perspective.

Curvilinear projection, _z=r_:

~~~spl svg=A
let r = 1;
let i = (-1 -- 1).discretize(15);
let z = r;
{ :x :y |
	[x y z].curvilinearProjection(r)
}.table(i, i).catenate.PointCloud
~~~

![](Help/Image/curvilinearProjection-A.svg)

Curvilinear projection, _z>r_:

~~~spl svg=B
let r = 1;
let i = (-1 -- 1).discretize(15);
let z = 2;
{ :x :y |
	[x y z].curvilinearProjection
}.table(i, i).catenate.PointCloud
~~~

![](Help/Image/curvilinearProjection-B.svg)

Curvilinear projection, _z<r_:

~~~spl svg=C
let r = 1;
let i = (-1 -- 1).discretize(15);
let z = 1 / 3;
{ :x :y |
	[x y z].curvilinearProjection
}.table(i, i).catenate.PointCloud
~~~

![](Help/Image/curvilinearProjection-C.svg)

* * *

See also: AxonometricProjection, square, squareRoot

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CurvilinearCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Curvilinear_perspective)
[2](https://en.wikipedia.org/wiki/Curvilinear_coordinates)
