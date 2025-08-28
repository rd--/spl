# cohenSutherlandAlgorithm

- _cohenSutherlandAlgorithm(l, r)_

Implement the Cohen–Sutherland algorithm to clip the line _l_ to lie within the rectangle _r_.

```
>>> Line([-2 -2; 2 2])
>>> .cohenSutherlandAlgorithm(
>>> 	Rectangle([-1 -1], [1 1])
>>> )
Line([-1 -1; 1 1])
```

Clip lines along each axis and diagonal:

~~~spl svg=A
let r = Rectangle([-1 -1], [1 1]);
[
	r,
	[
		-2  0;  2  0:;
		-2 -2;  2  2:;
		 0 -2;  0  2:;
		 2 -2; -2  2
	].collect { :c |
		Line(c)
		.cohenSutherlandAlgorithm(r)
	}
].LineDrawing
~~~

![](sw/spl/Help/Image/cohenSutherlandAlgorithm-A.svg)

Clip lines at every fourth degree of rotation:

~~~spl svg=B
let r = Rectangle([-0.25 -0.25], [0.25 0.25]);
[0, 4 .. 356].collect { :i |
	let theta = i.degree;
	Line([0 0; theta.cos theta.sin])
	.cohenSutherlandAlgorithm(r)
}.LineDrawing
~~~

![](sw/spl/Help/Image/cohenSutherlandAlgorithm-B.svg)

* * *

See also: Line, Rectangle, sutherlandHodgmanAlgorithm

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland_algorithm)
