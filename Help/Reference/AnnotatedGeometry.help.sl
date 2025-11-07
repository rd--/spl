# AnnotatedGeometry

- _AnnotatedGeometry(g, r)_

A `Type` that represents a geometry with annotations.

Draw a red, semi-opaque annulus sector:

~~~spl svg=A
AnnotatedGeometry(
	AnnulusSector(
		[0 0],
		[0.5 1],
		[-1/3 2/3].pi
	),
	(
		fillColour: RgbColour(
			[1 0 0],
			0.5
		)
	)
)
~~~

![](sw/spl/Help/Image/AnnotatedGeometry-A.svg)

* * *

See also: Geometry

Guides: Geometry Functions
