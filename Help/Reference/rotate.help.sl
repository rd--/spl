# rotate

- _rotate([x₁ x₂ …], n=1)_
- _rotate(g, theta)_

At `List`,
answer _x_ rotated to the right by _n_ places.

```
>>> [1 3 2 4 5].rotate(1)
[5 1 3 2 4]

>>> [1 3 2 4 5].rotate(-1)
[3 2 4 5 1]
```

The rotation is not in place:

```
>>> let a = [1 2 3];
>>> let b = a.rotate(1);
>>> (a, b)
([1 2 3], [3 1 2])
```

At `Geometry`,
answer the value _g_ rotated _theta_ radians counter-clockwise about its `centroid`.

A square rotated by one eighth turn:

~~~spl svg=A
let g = [1 3].unitSquare;
[
	g,
	Point(g.centroid),
	g.rotate(1/4.pi)
].LineDrawing
~~~

![](sw/spl/Help/Image/rotate-A.svg)

* * *

See also: centroid, circulantMatrix, Polygon, rotateLeft, rotateRight, scaled

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Rotate.html)
