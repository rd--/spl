# AnnulusSector

- _AnnulusSector([x y …], [r₁ r₂], [θ₁ θ₂])_

A `Type` that represents an annulus sector between arcs of radii _r_ and angles _θ_ at center _(x,y)_.

An annulus sector:

```
>>> AnnulusSector(
>>> 	[0 0],
>>> 	[0.75 1],
>>> 	[-1/3 2/3].pi
>>> ).area
7/32.pi
```

Draw an annulus sector:

~~~spl svg=A
AnnulusSector([0 0], [0.5 1], [-1/3 2/3].pi)
~~~

![](sw/spl/Help/Image/AnnulusSector-A.svg)

A circular grid:

~~~spl svg=B
let m = 3;
let n = 8;
let theta = 2.pi / n;
{ :i :j |
	AnnulusSector(
		[0, 0],
		[i, i + 1],
		[theta * j, theta * (j + 1)]
	)
}.table(1:m, 1:n).LineDrawing
~~~

![](sw/spl/Help/Image/AnnulusSector-B.svg)

* * *

See also: Annulus, Arc, Circle, Line

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Annulus.html)
[2](https://reference.wolfram.com/language/ref/Annulus.html),
_W_
[1](https://en.wikipedia.org/wiki/Annulus_(mathematics))

