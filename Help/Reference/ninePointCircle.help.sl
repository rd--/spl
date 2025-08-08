# ninePointCircle

- _ninePointCircle([p₁ p₂ p₃])_

The nine-point circle,
also called Euler’s circle or the Feuerbach circle,
is the circle that passes through the medial triangle of a triangle.

```
>>> let x = 1/12.sqrt;
>>> let t = [1 1 1].sssTriangle;
>>> (
>>> 	t.ninePointCircle,
>>> 	t.medialTriangle.circumcircle
>>> )
(Circle([0.5 x], x), Circle([0.5 x], x))
```

At `List`:

~~~spl svg=A
let p = [0 0; 0 1 ; 1 0];
[
	p.Triangle,
	p.ninePointCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/ninePointCircle-A.svg)

At `Triangle`:

~~~spl svg=B
let t = sssTriangle(1, 1, 1);
[
	t,
	t.ninePointCircle
].LineDrawing
~~~

![](sw/spl/Help/Image/ninePointCircle-B.svg)

* * *

See also: circleThrough, medialTriangle, ninePointCenter, orthocenter

Guides: Geometry Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Nine-PointCircle.html),
_W_
[1](https://en.wikipedia.org/wiki/Nine-point_circle)
