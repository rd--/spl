# windingNumber

- _windingNumber(c, p)_

Answer the number of times a closed curve _c_ winds around a point _p_.
The coordinate list should be in counterclockwise orientation with no overlapping,
and should not contain the closing vertex.

Winding number given a simple convex polygon:

```
>>> [1 0; 0 1.5; -1 0]
>>> .windingNumber([0 0.5])
1
```

Count how many times a closed curve winds around a point:

```
>>> [0.35 0.2; 0.9 0.75; 0.1 0.55; 0.9 0.35; 0.42 0.9]
>>> .windingNumber([0.55 0.6])
2
```

Winding number given concave polygon:

```
>>> [1 0; 0 2; -1 0; 0 1]
>>> .windingNumber([0 1.5])
1
```

Find the polygon density of regular star polygons:

```
>>> let p = 7;
>>> let q = 3;
>>> let c = p.circlePoints(1);
>>> let i = { :x |
>>> 	(x + q).mod(p, 1)
>>> }.nestList(1, p);
>>> c.atAll(i).windingNumber([0 0])
3
```

A non-zero winding number indicates a point lies inside a polygon:

~~~spl svg=A
[
	Polygon(
		[
			0.35 0.2;
			0.9 0.75;
			0.1 0.55;
			0.9 0.35;
			0.42 0.9
		]
	),
	Point([0.55 0.6])
].LineDrawing
~~~

![](sw/spl/Help/Image/windingNumber-A.svg)

* * *

See also: containsPoint, crossingNumber

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/ContourWindingNumber.html)
[2](https://reference.wolfram.com/language/ref/WindingCount.html),
_W_
[1](https://en.wikipedia.org/wiki/Winding_number)
