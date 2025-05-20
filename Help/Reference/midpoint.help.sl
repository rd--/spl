# midpoint

- _midpoint([p₁ p₂])_

Answer the midpoint of the line segment connecting two points.

Find the midpoint of two points:

```
>>> [1 1; 2 3].midpoint
[3/2 2]
```

Midpoint in two dimensions:

```
>>> [1 1; 3 4].midpoint
[2 5/2]
```

Midpoint in three dimensions:

```
>>> [1 2 3; 4 5 6].midpoint
[5/2 7/2 9/2]
```

Midpoint in four dimensions:

```
>>> [1 2 -1 3; 4 2 -3 -2].midpoint
[5/2 2 -2 1/2]
```

The midpoint between two `Point` values is a `Point` value:

```
>>> [1 1].Point.midpoint([2 3].Point)
[3/2 2].Point
```

The midpoint is equidistant from the two points:

```
>>> let p1 = [1 2];
>>> let p2 = [3 4];
>>> let p3 = [p1 p2].midpoint;
>>> (
>>> 	p1.euclideanDistance(p3),
>>> 	p2.euclideanDistance(p3)
>>> )
(2.sqrt, 2.sqrt)
```

For coordinates, `midpoint` gives the same result as `mean`:

```
>>> [1 2; -3 5].midpoint
[1 2; -3 5].mean
```

Draw a series of seven pentagons,
each placed at the midpoints of the line segments of the last:

~~~spl svg=A
let k = 5;
let n = 7;
{ :last |
	(1 .. k).collect { :i |
		let j = i % k + 1;
		[last[i], last[j]].midpoint
	}
}.nestList(
	k.circlePoints([0 0], 1, 0),
	n - 1
).collect(
	Polygon:/1
).LineDrawing
~~~

![](sw/spl/Help/Image/midpoint-A.svg)

* * *

See also: Line, Point

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Midpoint.html)
[2](https://reference.wolfram.com/language/ref/Midpoint.html),
_W_
[1](https://en.wikipedia.org/wiki/Midpoint)

Categories: Geometry
