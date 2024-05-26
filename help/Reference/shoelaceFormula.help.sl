# shoelaceFormula

- _shoelaceFormula(vertices)_

Answer the area of a simple polygon whose _vertices_ are described by their Cartesian coordinates in the plane
according to the shoelace formula.

Calculate the area of a pentagon:

```
>>> [1 6; 3 1; 7 2; 4 4; 8 5].shoelaceFormula
16.5
```

Manipulations of a polygon:

```
>>> let [p1, p2, p3, p4, p5] = [3 1; 7 2; 4 4; 8 6; 1 7];
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
[1](https://en.wikipedia.org/wiki/Shoelace_formula)

Further Reading: Meister 1769
