# unitCircle

- _unitCircle(center)_

A `Circle` with radius `one` at _center_.

```
>>> [0 0].unitCircle
Circle([0 0], 1)
```

A drawing:

~~~spl svg=A
[0 0].unitCircle.asLineDrawing
~~~

![](sw/spl/Help/Image/unitCircle-A.svg)

Threads over lists:

~~~spl svg=B
[0 0; 1 1; 2 2].unitCircle.LineDrawing
~~~

![](sw/spl/Help/Image/unitCircle-B.svg)

* * *

See also: Circle, LineDrawing, unitSquare

References:
_Mathematica_
[1](https://mathworld.wolfram.com/UnitCircle.html),
_W_
[1](https://en.wikipedia.org/wiki/Unit_circle)

Categories: Geometry
