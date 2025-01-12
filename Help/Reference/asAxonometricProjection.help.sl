# asAxonometricProjection

- _asAxonometricProjection(aMatrix)_

Answer the `AxonometricProjection` corresponding to _aMatrix_,
which specifies the polar coordinates of the _X_, _Y_ and _Z_ axes.

Draw the standard _isometric_ projection of the unit cube:

~~~spl svg=A
[0 0 0]
.unitCube
.asPerspectiveDrawing(
	[
		1 5/6.pi;
		1 3/6.pi;
		1 1/6.pi
	].asAxonometricProjection
)
~~~

![](sw/spl/Help/Image/asAxonometricProjection-A.svg)

* * *

See also: AxonometricProjection, asAxonometricProjection, unitDodecahedron, unitIcosahedron

Guides: Perspective Drawings
