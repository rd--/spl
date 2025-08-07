# centeredRectangle

- _centeredRectangle([x y], [w h])_

A `Rectangle` with side lengths of _w_ and _h_ centered at _(x,y)_.

```
>>> centeredRectangle([0 0], [1 1])
Rectangle([-0.5 -0.5], [0.5 0.5])

>>> centeredRectangle([0.5 0.5], [1 1])
Rectangle([0 0], [1 1])
```

A drawing:

~~~spl svg=A
let c = [0 0];
let phi = 1.goldenRatio;
[
	Circle(c, 2.sqrt / 2),
	centeredRectangle(c, [1, 1]),
	centeredRectangle(c, [1 / phi, 1])
].LineDrawing
~~~

![](sw/spl/Help/Image/centeredRectangle-A.svg)

* * *

See also: Rectangle, unitSquare

Categories: Geometry
