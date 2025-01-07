# gluPerspective

- _gluLookAt(fovy, aspect, zNear, zFar)_

Define a perspective matrix.
_fovy_ specifies the field of view angle, in degrees, in the _y_ direction.
_aspect_ specifies the aspect ratio that determines the field of view in the _x_ direction.
_zNear_ specifies the distance from the viewer to the near clipping plane (always positive).
_zFar_ specifies the distance from the viewer to the far clipping plane (always positive).

```
>>> gluPerspective(30, 1, 1, 100)
[
	3.732 0 0 0;
	0 3.732 0 0;
	0 0 -1.0202 -1;
	0 0 -2.0202 0
]
```

Combination of `gluPerspective` and `gluLookAt`:

```
>>> let m1 = gluPerspective(30, 1, 1, 100);
>>> let m2 = gluLookAt(
>>> 	[0 0 10],
>>> 	[0 0 0],
>>> 	[0 1 0]
>>> );
>>> m1.dot(m2)
[
	3.732 0 0 0;
	0 3.732 0 0;
	0 0 -1.0202 9.2020;
	0 0 -2.0202 20.2020
]
```

* * *

See also: dot, gluLookAt

References:
_Khronos_
[1](https://registry.khronos.org/OpenGL-Refpages/gl2.1/xhtml/gluPerspective.xml)
