# Perspective Drawings

In each of the pictures below the rectangle _r_ is in the _x_ & _y_ plane,
measures twice as long on the _x_ as the the _y_ axis,
and the line _l_ moves in positive steps first along the _z_ axis,
then the _y_ axis,
then lastly the _x_ axis.

~~~
workspace::scene := [
	[	-2 -1 0;
		+2 -1 0;
		+2 +1 0;
		-2 +1 0
	].Polygon,
	[
		0 0 0;
		0 0 1;
		0 1 1;
		1 1 1
	].Line
].GeometryCollection
~~~

One convention is that
_x_ is back to front,
_y_ is left to right, and
_z_ is below to above.
This is a _right-handed_ convention.

In this case the _x_ & _y_ plane is horizontal,
and the line _l_ first moves up (_z_),
then right (_y_),
then toward the front (_x_):

~~~spl svg=A
workspace::scene
.asPerspectiveDrawing(
	[
		-1/2 1/6.pi;
		1 0;
		1 1/2.pi
	].asAxonometricProjection
)
~~~

![](<sw/spl/Help/Image/Perspective Drawings-A.svg>)

Another convention is that
_x_ is left to right,
_y_ is below to above, and
_z_ is front to back.
This is a _left-handed_ convention.

In the picture below the rectangle _r_ is in the vertical (_x_ & _y_) plane,
and the line _l_ first moves toward the back (_z_), then up (_y_), then right (_x_):

~~~spl svg=B
workspace::scene
.asPerspectiveDrawing(
	[
		0 1;
		1/2.pi 1;
		1/6.pi 1/2
	].asAxonometricProjection
)
~~~

![](<sw/spl/Help/Image/Perspective Drawings-B.svg>)

Another convention is that
_x_ is left to right,
_y_ is front to back, and
_z_ is below to above.
This is a _right-handed_ convention.

In the picture below the rectangle _r_ is in the horizontal (_x_ & _y_) plane,
and the line _l_ first moves upward (_z_),
then backward (_y_),
then rightward (_x_):

~~~spl svg=C
workspace::scene
.asPerspectiveDrawing(
	[
		0 1;
		1/6.pi 1/2;
		1/2.pi 1
	].asAxonometricProjection
)
~~~

![](<sw/spl/Help/Image/Perspective Drawings-C.svg>)

The `linePlot` method follows the first convention:

~~~spl svg=D
[
	0 0 0;
	0 0 1;
	1 0 1;
	1 1 1
].linePlot
~~~

![](<sw/spl/Help/Image/Perspective Drawings-D.svg>)

* * *

See also: AxonometricProjection, linePlot

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CartesianCoordinates.html),
_W_
[1](https://en.wikipedia.org/wiki/Cartesian_coordinate_system)
