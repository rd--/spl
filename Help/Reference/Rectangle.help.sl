# Rectangle

- _Rectangle(lowerLeft, upperRight)_

A `Type` that represents an axis-aligned rectangle from _lowerLeft_ to _upperRight_.

```
>>> let r = [0 0; 1 1].asRectangle;
>>> (
>>> 	r.isRectangle,
>>> 	r.center,
>>> 	r.width,
>>> 	r.height
>>> )
(true, [0.5 0.5], 1, 1)
```

Quadrants:

```
>>> let r = [0 0; 1 1].asRectangle;
>>> (
>>> 	r.lowerLeftQuadrant.center,
>>> 	r.upperRightQuadrant.center
>>> )
(
	[1/4 1/4],
	[3/4 3/4]
)
```

Calculate the `circumcircle` and `incircle`, the latter only existing for squares:

```
>>> let r = [-1 -1; 1 1].asRectangle;
>>> (r.circumcircle, r.incircle)
(Circle([0 0], 2 * 2.sqrt), Circle([0 0], 1))
```

Calculate the `centroid`:

```
>>> Rectangle([0 1], [3 3]).centroid
[3/2 2]
```

Two squares:

~~~spl svg=A
Rectangle(
	[0 0; 0.5 0.5],
	[1 1; 1.5 1.5]
).LineDrawing
~~~

![](sw/spl/Help/Image/Rectangle-A.svg)

Two golden rectangles, one rotated:

~~~spl svg=B
let r = Rectangle([0 0], [1.goldenRatio 1]);
[
	r,
	r.asPolygon.rotated(pi / 3)
].LineDrawing
~~~

![](sw/spl/Help/Image/Rectangle-B.svg)

A sequence of nine randomly displaced squares,
each rotated:

~~~spl svg=C
let rng = Sfc32(314920);
1:9.collect { :x |
	let y = rng.next * 4;
	Rectangle(
		[x, y],
		[x + 1, y + 1]
	).asPolygon.rotated(rng.next * pi)
}.LineDrawing
~~~

![](sw/spl/Help/Image/Rectangle-C.svg)

Golden rectangle sub-divisions:

~~~spl svg=D
let phi = 1.goldenRatio;
let f = { :n |
	(n = 0).if {
		[0, 0, 1, -1]
	} {
		let [a, b, c, d] = f(n - 1);
		let x = phi ^ n.-;
		(n % 4).caseOf([
			0 -> [a, d, a + x, d - x],
			1 -> [c, d + x, c + x, d],
			2 -> [c - x, b + x, c, b],
			3 -> [a - x, b, a, b - x]
		])
	}
};
0:7.collect { :k |
	let [a, b, c, d] = f(k);
	Rectangle([a, b.-], [c, d.-])
}.LineDrawing
~~~

![](sw/spl/Help/Image/Rectangle-D.svg)

* * *

See also: asLineDrawing, asPolygon, asRectangle, Circle, Line, LineDrawing, Point, Polygon, Triangle, unitSquare

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Rectangle.html)
[2](https://mathworld.wolfram.com/Square.html)
[3](https://reference.wolfram.com/language/ref/Rectangle.html)

Categories: Geometry
