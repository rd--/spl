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

* * *

See also: antipedalTriangle, Triangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FirstFermatPoint.html)
_W_
[1](https://en.wikipedia.org/wiki/Fermat_point)
