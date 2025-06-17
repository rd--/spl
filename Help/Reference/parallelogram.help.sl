# parallelogram

- _parallelogram(p, [v₁ v₂])_

Answer a `Polygon` holding a parallelogram with origin _p_ and directions _v₁_ and _v₂_.

Draw a parallelogram:

~~~spl svg=A
[0 0].parallelogram([3 0; 1 4])
~~~

![](sw/spl/Help/Image/parallelogram-A.svg)

Calculate the `area` of a standard parallelogram:

```
>>> [0 0].parallelogram([1 0; 1 1])
>>> .area
1

>>> [1 0; 1 1].determinant.abs
1
```

Calculate the `centroid` of a standard parallelogram:

```
>>> [0 0].parallelogram([1 0; 1 1])
>>> .centroid
[1 1/2]
```

Point membership test:

```
>>> let p = [0 0].parallelogram([1 0; 1 1]);
>>> [1/2 1/2; -1/2 -1/2].collect { :each |
>>> 	p.containsPoint(each)
>>> }
[true false]
```

A rhombus is a parallelogram in which all edges are the same length:

```
>>> [0 0].parallelogram([
>>> 	[1, 0],
>>> 	[2 / 5.sqrt, 1 / 5.sqrt]
>>> ]).sideLengths
[1 1 1 1]
```

A parallelogram with sides that form right angles is a rectangle:

```
>>> let p = [2 1];
>>> let [v1, v2] = [1 2; 4 -2];
>>> (
>>> 	p.parallelogram([v1, v2]).area,
>>> 	[v1, v2].determinant.abs,
>>> 	v1.dot(v2)
>>> )
(10, 10, 0)
```

Draw a rectanglular parallelogram:

~~~spl svg=B
[2 1].parallelogram([1 2; 4 -2])
~~~

![](sw/spl/Help/Image/parallelogram-B.svg)

* * *

See also: Cuboid, Polygon, Rectangle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Parallelogram.html)
[2](https://reference.wolfram.com/language/ref/Parallelogram.html),
_W_
[1](https://en.wikipedia.org/wiki/Parallelogram)
