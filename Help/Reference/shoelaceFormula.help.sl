# shoelaceFormula

- _shoelaceFormula(vertices)_

Answer the signed area of a simple polygon whose _vertices_ are described by their Cartesian coordinates in the plane,
according to the shoelace formula.

Calculate the signed area of a pentagon:

```
>>> let p = [1 6; 3 1; 7 2; 4 4; 8 5];
>>> (
>>> 	p.shoelaceFormula,
>>> 	p.reversed.shoelaceFormula
>>> )
(16.5, -16.5)
```

Manipulations of a polygon:

```
>>> let p = [3 1; 7 2; 4 4; 8 6; 1 7];
>>> let [p1, p2, p3, p4, p5] = p;
>>> let q = [4 3];
>>> [
>>> 	p1 p2 p3 p4 p5;
>>> 	p2 p3 p4;
>>> 	p1 q p2;
>>> 	p1 p2 p4 p5;
>>> 	p1 q p2 p3 p4 p5
>>> ].collect(shoelaceFormula:/1)
[20.5 -7 -3.5 27.5 17]
```

* * *

See also: area, Polygon

References:
_W_
[1](https://en.wikipedia.org/wiki/Shoelace_formula),
[2](https://en.wikipedia.org/wiki/Signed_area)

Further Reading: Meister 1769

Categories: Geometry
