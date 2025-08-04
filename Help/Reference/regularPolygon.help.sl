# regularPolygon

- _regularPolygon(n, center, radius, theta)_

Answer a regular `Polygon` of _n_ sides inscribed on a circle
(the _circumcircle_)
of _radius_,
at _center_,
with initial angle _theta_.

The regular four polygon is a diamond:

```
>>> 4.regularPolygon([0 0], 1, 0)
Polygon([1 0; 0 1; -1 0; 0 -1])
```

or a square:

```
>>> 4.regularPolygon([0 0], 2.sqrt, 1.pi / 4)
Polygon([1 1; -1 1; -1 -1; 1 -1])
```

The `interiorAngles` of a regular polygon are equal:

```
>>> 7.regularPolygon([0 0], 1, 0)
>>> .interiorAngles
2.244 # 7
```

The `centroid` of a regular polygon is its center:

```
>>> 7.regularPolygon([0 0], 1, 0)
>>> .centroid
[0 0]
```

The `arcLength` of a successive regular polygons with radius one half converges to π:

```
>>> 99.regularPolygon([0 0], 1/2, 0)
>>> .arcLength
3.141
```

Drawing of a pentagon:

~~~spl svg=A
5.regularPolygon([0 0], 1, 0)
~~~

![](sw/spl/Help/Image/regularPolygon-A.svg)

Drawing of a hexagon:

~~~spl svg=B
6.regularPolygon([0 0], 1, 0)
~~~

![](sw/spl/Help/Image/regularPolygon-B.svg)

Drawing of a diamond:

~~~spl svg=C
4.regularPolygon([0 0], 1, 0)
~~~

![](sw/spl/Help/Image/regularPolygon-C.svg)

Drawing of a square:

~~~spl svg=D
4.regularPolygon([0 0], 1, 1.pi / 4)
~~~

![](sw/spl/Help/Image/regularPolygon-D.svg)

Drawing of an _X_-axis aligned pentagon:

~~~spl svg=E
5.regularPolygon([0 0], 1, 1.pi / 10)
~~~

![](sw/spl/Help/Image/regularPolygon-E.svg)

Visualize a tiling with lattice points:

~~~spl svg=F
let b = [[3.sqrt.-, -1], [3.sqrt.-, 1]];
let c = 0:4.tuples(2).dot(b);
let t = c.collect { :each |
	6.regularPolygon(each, 1, 0)
};
let p = PointCloud(c);
[p, t].LineDrawing
~~~

![](sw/spl/Help/Image/regularPolygon-F.svg)

A collection of random regular polygons:

~~~spl svg=G
let rng = Sfc32(329843);
let p = {
	let n = rng.randomInteger([3 7], []);
	let c = rng.randomReal([0 9], [2]);
	let r = rng.randomReal([0 1], []);
	let t = rng.randomReal([0 1.pi], []);
	n.regularPolygon(c, r, t)
} ! 23;
p.LineDrawing
~~~

![](sw/spl/Help/Image/regularPolygon-G.svg)

Overlap regular polygons of increasing radii and vertices:

~~~spl svg=H
1:9.collect { :r |
	let n = r + 2;
	let t = (1 / n).pi - (1 / 2).pi;
	n.regularPolygon([0 0], r, t)
}.LineDrawing
~~~

![](sw/spl/Help/Image/regularPolygon-H.svg)

The `arcLength` of successive regular polygons with radius `one` approximates _2π_:

~~~spl svg=I
(3 .. 47).functionPlot { :n |
	n.regularPolygon([0 0], 1, 0).arcLength
}
~~~

![](sw/spl/Help/Image/regularPolygon-I.svg)

* * *

See also: circlePoints, interiorAngles, Polygon, unitSquare

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RegularPolygon.html)
[2](https://reference.wolfram.com/language/ref/RegularPolygon.html),
_W_
[1](https://en.wikipedia.org/wiki/Regular_polygon)

Categories: Geometry
