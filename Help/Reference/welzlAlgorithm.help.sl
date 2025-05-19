# welzlAlgorithm

- _welzlAlgorithm(p)_

Implement the Welzl algorithm to find the smallest circle that contains all of the points specified at _p_.

With three points, all are on the boundary:

```
>>> [0 0; 0 1; 1 0].welzlAlgorithm
Circle([0.5 0.5], 0.7071)
```

With five points:

```
>>> [5 -2; -3 -2; -2 5; 1 6; 0 2].welzlAlgorithm
Circle([1 1], 5)

>>> [3 10; 6 3; 10 2; 2 8; 3 3].welzlAlgorithm
Circle([6.5, 6], 5.3151)
```

With ten points:

```
>>> [
>>> 	0 0; -2 -1; 3 -4; 2 8; 3 11;
>>> 	-8 -2; -14 -6; 7 3; 10 4; -1 4
>>> ].welzlAlgorithm
Circle([-2 -1], 13)
```

Draw points and circle,
the circle is inscribed on three points:

~~~spl svg=A
let p = [
	0 0; -2 -1; 3 -4; 2 8; 3 11;
	-8 -2; -14 -6; 7 3; 10 4; -1 4
];
[
	p.PointCloud,
	p.welzlAlgorithm
].LineDrawing
~~~

![](sw/spl/Help/Image/welzlAlgorithm-A.svg)

Draw points and circle,
the circle is inscribed on two points:

~~~spl svg=B
let p = [3 10; 6 3; 10 2; 2 8; 3 3];
[
	p.PointCloud,
	p.welzlAlgorithm
].LineDrawing
~~~

![](sw/spl/Help/Image/welzlAlgorithm-B.svg)

* * *

See also: Circle, circleThrough, circumcircle

Guides: Geometry Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/BoundingRegion.html)
_W_
[1](https://en.wikipedia.org/wiki/Smallest-circle_problem)

Further Reading: Welzl 1991
