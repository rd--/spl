# unitCube

- _unitCube(center)_

Answer a `Polyhedron` of the unit cube at _center_.

The `vertices` of the unit cube at _(0.5,0.5,0.5)_:

```
>>> (0.5 # 3).unitCube.vertices
[
	0 0 0;
	1 0 0;
	1 1 0;
	0 1 0;
	0 0 1;
	1 0 1;
	1 1 1;
	0 1 1
]
```

Draw the unit cube:

~~~spl svg=A
[0 0 0].unitCube.asLineDrawing
~~~

![](sw/spl/Help/Image/unitCube-A.svg)

* * *

See also: LineDrawing, Polyhedron, unitSquare

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitCube.html)
[2](https://reference.wolfram.com/language/ref/Cube.html)

Categories: Geometry
