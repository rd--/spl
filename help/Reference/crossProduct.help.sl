# crossProduct

_crossProduct(aVector, anotherVector)_

The cross product of two vectors in three dimensions:

	Point(1, 2, -1).crossProduct(Point(-1, 1, 0)) = Point(1, 1, 3)
	Point(3.2, 4.2, 5.2).crossProduct(Point(0.75, 0.09, 0.06)) ~ Point(-0.216, 3.708, -2.862)

Cross product of complex vectors:

	Point(1.3j1, 2, 3j-2).crossProduct(Point(6j1, 4, 5j-7)) = Point(-2j-6, 6.5j-4.9, -6.8j2)

Cross product of exact vectors:

	Point(1, 2, 3).crossProduct(Point(1, 8, 9)) = Point(-6, -6, 6)
	Point(1, 2, 3).crossProduct(Point(1, 4, 9)) = Point(6, -6, 2)

Find the area of the parallelogram defined by two vectors:

	Point(1, 2, -2).crossProduct(Point(1, -1, 2)).asArray.norm = 29.sqrt

* * *

See also:

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CrossProduct.html)
[2](https://reference.wolfram.com/language/ref/Cross.html)
