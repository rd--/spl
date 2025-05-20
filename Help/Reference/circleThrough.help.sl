# circleThrough

- _circleThrough([p₁, p₂])_
- _circleThrough([p₁, p₂, p₃])_

Answer the `Circle` passing through the specified points.

Circles passing through two points:

```
>>> [0 0; 0 1].circleThrough
Circle([0 0.5], 0.5)

>>> [0 0; 1 1].circleThrough
Circle([0.5 0.5], 0.7071)
```

A circle passing through three points:

```
>>> [0 0; 0 1; 1 0].circleThrough
Circle([0.5 0.5], 0.7071)

>>> [2 1; 0 5; -1 2].circleThrough
Circle([1 3], 2.2361)

>>> [-6 5; -3 -4; 2 1].circleThrough
Circle([-3 1], 5)
```

The `arcLength` of an circle passing through three points:

```
>>> [
>>> 	[1 / 2, 3.sqrt / 2],
>>> 	[-1 / 2, 3.sqrt /2],
>>> 	[-1, 0]
>>> ].circleThrough.arcLength
2.pi
```

Plot two points and the circle passing through them:

~~~spl svg=A
let p = [0 0; 0 1];
[
	p.PointCloud,
	p.circleThrough
].LineDrawing
~~~

![](sw/spl/Help/Image/circleThrough-A.svg)

Plot two points and the circle passing through them:

~~~spl svg=B
let p = [0 0; 1 1];
[
	p.PointCloud,
	p.circleThrough
].LineDrawing
~~~

![](sw/spl/Help/Image/circleThrough-B.svg)

Plot three points and the circle passing through them:

~~~spl svg=C
let p = [0 0; 0 1; 1 0];
[
	p.PointCloud,
	p.circleThrough
].LineDrawing
~~~

![](sw/spl/Help/Image/circleThrough-C.svg)

Plot three points and the circle passing through them:

~~~spl svg=D
let p = [
 	[1 / 2, 3.sqrt / 2],
 	[-1 / 2, 3.sqrt /2],
 	[-1, 0]
];
[
	p.PointCloud,
	p.circleThrough
].LineDrawing
~~~

![](sw/spl/Help/Image/circleThrough-D.svg)

* * *

See also: Circle, circlePoints, circumcircle, circumsphere, Disk

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/CircleThrough.html)
