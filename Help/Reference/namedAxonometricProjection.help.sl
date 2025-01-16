# namedAxonometricProjection

- _namedAxonometricProjection(aString)_
- _namedAxonometricProjection(aString, alpha)_

Answer the named `AxonometricProjection`.

Draw the standard _isometric_ projection of the unit dodecahedron:

~~~spl svg=A
[0 0 0]
.unitDodecahedron
.asPerspectiveDrawing(
	'Isometric'.namedAxonometricProjection
)
~~~

![](sw/spl/Help/Image/namedAxonometricProjection-A.svg)

Draw a _cabinet oblique_ projection of the unit icosahedron,
with the _Z_-axis angle set to _pi/6_:

~~~spl svg=B
[0 0 0]
.unitIcosahedron
.asPerspectiveDrawing(
	'CabinetOblique'
	.namedAxonometricProjection(pi / 6)
)
~~~

![](sw/spl/Help/Image/namedAxonometricProjection-B.svg)

* * *

See also: AxonometricProjection, asAxonometricProjection, unitDodecahedron, unitIcosahedron

Guides: Perspective Drawings
