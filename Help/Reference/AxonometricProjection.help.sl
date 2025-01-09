# AxonometricProjection

- _AxonometricProjection(alpha, beta, x, y, z)_
- _AxonometricProjection(aString)_

Projections from three to two dimensions.

_alpha_ gives the angle of projection for the _Z₃_ axis,
in radians,
where `zero` indicates the positive _X₂_ axis,
and rotation is counter-clockwise.

_beta_ gives the angle of projection of the _X₃_ axis,
in radians,
where `zero` indicates the negative _X₂_ axis,
and rotation is clockwise.

The _Y₃_ axis angle is fixed,
and points along the positive _Y₂_ axis.

_x_, _y_ and _z_ are scaling factors for each axis.

If both _alpha_ and _beta_ are `zero`,
the cube is projected as two horizontally adjacent squares:

~~~spl svg=A
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	AxonometricProjection(
		0, 0,
		1, 1, 1
	)
)
~~~

![](sw/spl/Help/Image/AxonometricProjection-A.svg)

If either _alpha_ or _beta_ is `zero`,
and the other is half of `pi`,
the cube is projected as two vertically adjacent squares:

~~~spl svg=B
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	AxonometricProjection(
		pi / 2, 0,
		1, 1, 1
	)
)
~~~

![](sw/spl/Help/Image/AxonometricProjection-B.svg)

If _alpha_ and _beta_ are both one-sixth of `pi` (30°),
the ordinary Farish isometric projection is given,
and the cube is projected as a hexagon:

~~~spl svg=C
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	AxonometricProjection(
		pi / 6, pi / 6,
		1, 1, 1
	)
)
~~~

![](sw/spl/Help/Image/AxonometricProjection-C.svg)

If _alpha_ and _beta_ are both one-quarter of `pi` (45°),
the planometric or military projection is given:

~~~spl svg=D
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	AxonometricProjection(
		pi / 4, pi / 4,
		1, 1, 1
	)
)
~~~

![](sw/spl/Help/Image/AxonometricProjection-D.svg)

ISO 5456-3 (NEN 2536) gives the following dimetric projection for technical drawings:

~~~spl svg=E
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	AxonometricProjection(
		42.degree, 7.degree,
		1, 1, 1 / 2
	)
)
~~~

![](sw/spl/Help/Image/AxonometricProjection-E.svg)

The oblique projection given by Carlbom and Paciorek in Figure 3-11b:

~~~spl svg=F
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	AxonometricProjection(
		30.degree, 0,
		1, 1, 2 / 3
	)
)
~~~

![](sw/spl/Help/Image/AxonometricProjection-F.svg)

A trimetric projection given by Carlbom and Paciorek in Figure 3-9:

~~~spl svg=G
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	AxonometricProjection(
		24.degree, 17.degree,
		7 / 8, 1, 3 / 4
	)
)
~~~

![](sw/spl/Help/Image/AxonometricProjection-G.svg)

The last oblique projection given by Carlbom and Paciorek in Figure 3-12:

~~~spl svg=H
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	AxonometricProjection(
		30.degree, 0,
		1, 1, 1 / 2
	)
)
~~~

![](sw/spl/Help/Image/AxonometricProjection-H.svg)

* * *

See also: linePlot

Guides: Perspective Drawings

References:
_W_
[1](https://en.wikipedia.org/wiki/Axonometric_projection)
[2](https://en.wikipedia.org/wiki/Isometric_projection)
[3](https://en.wikipedia.org/wiki/Orthographic_projection)

Further Reading: Carlbom and Paciorek 1978, Farish 1822, Krikke 2000
