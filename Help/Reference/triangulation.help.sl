# triangulation

- _triangulation(p)_

Answer a triangulation of the polygon _p_.

```
>>> Polygon([10 0; 0 50; 60 60; 70 10])
>>> .triangulation
[2 1 4; 4 3 2]
```

Draw a scaled triangulation of a simple four-polygon into two triangles

~~~spl svg=A
let c = [10 0; 0 50; 60 60; 70 10];
Polygon(c).triangulation.collect { :each |
	c.atAll(each).Triangle.scale(0.85)
}.LineDrawing
~~~

![](sw/spl/Help/Image/triangulation-A.svg)

Draw a scaled triangulation of a randomly generated thirteen-polygon into eleven triangles:

~~~spl svg=B
let r = Sfc32(738941);
let p = r.randomSimplePolygon(13);
let c = p.vertexCoordinates;
p.triangulation.collect { :each |
	c.atAll(each).Triangle.scale(0.85)
}.LineDrawing
~~~

![](sw/spl/Help/Image/triangulation-B.svg)

* * *

See also: delaunayMesh, Polygon, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Triangulation.html),
_W_
[1](https://en.wikipedia.org/wiki/Polygon_triangulation)
