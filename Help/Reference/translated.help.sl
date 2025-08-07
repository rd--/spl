# translated

- _translated(g, [x y …])_

Translate the geometry _g_ by the vector _x,y,…_.

At `Circle`:

```
>>> Circle([1 0], 1).translated([2, -1])
Circle([3 -1], 1)
```

At `Rectangle`:

```
>>> Rectangle([-1 -2], [2 1])
>>> .translated([-1 3])
Rectangle([-2 1], [1 4])
```

At `Polygon`:

```
>>> 4.regularPolygon([1 3], 1, 0)
>>> .translated([2 -5])
Polygon([4 -2; 3 -1; 2 -2; 3 -3])
```

Touching circles:

~~~spl svg=A
{ :c |
	c.translated([2.sqrt 2.sqrt])
}.nestList(Circle([-3 -3], 1), 4)
.LineDrawing
~~~

![](sw/spl/Help/Image/translated-A.svg)

Touching rectangles:

~~~spl svg=B
let phi = 1.goldenRatio;
{ :c |
	c.translated([1 1])
}.nestList(Rectangle([0 0], [1 phi]), 4)
.LineDrawing
~~~

![](sw/spl/Help/Image/translated-B.svg)

Touching polygons:

~~~spl svg=C
{ :c |
	c.translated([1 1.goldenRatio])
}.nestList(5.regularPolygon([1 3], 1, 0), 4)
.LineDrawing
~~~

![](sw/spl/Help/Image/translated-C.svg)

* * *

See also: rotated, scaled

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Translate.html)
