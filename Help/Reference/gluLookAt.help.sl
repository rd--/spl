# gluLookAt

- _gluLookAt(eye, center, up)_

Define a viewing transformation.
_eye_ specifies the position of the eye point,
_center_ specifies the position of the reference point,
_up_ specifies the direction of the up vector.

```
>>> gluLookAt([0 0 10], [0 0 0], [0 1 0])
[1 0 0 0; 0 1 0 0; 0 0 1 -10; 0 0 0 1]

>>> gluLookAt([4 3 3], [0 0 0], [0 1 0])
[
	0.6 -0.4116 0.6860 -4;
	0 0.8575 0.5145 -3;
	-0.8 -0.3087 0.5145 -3;
	0 0 0 1
]
```

* * *

See also: gluPerspective

References:
_Khronos_
[1](https://registry.khronos.org/OpenGL-Refpages/gl2.1/xhtml/gluLookAt.xml)
