# firstFermatPoint

- _firstFermatPoint(t)_

Answer the first Fermat point of the triangle _t_.

The antipedal triangle of the first Fermat point is equilateral:

```
>>> let t = [4 5 4].sssTriangle;
>>> t.antipedalTriangle(
>>> 	t.firstFermatPoint
>>> ).sideLengths
[8.60555 8.60555 8.60555]
```

Draw the first Fermat point and the associated antipedal triangle:

~~~spl svg=A
let t = [4 5 4].sssTriangle;
let p = t.firstFermatPoint;
[
	t,
	t.antipedalTriangle(p),
	p.Point
].LineDrawing
~~~

![](sw/spl/Help/Image/firstFermatPoint-A.svg)

* * *

See also: antipedalTriangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FirstFermatPoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Fermat_point)
