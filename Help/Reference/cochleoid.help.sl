# cochleoid

- _cochleoid(a)_

Answer a `Block` implementing the cochleoid curve,
a snail-shaped curve similar to a strophoid,
given by the polar equation _r=asinθ/θ_.

Line drawing:

~~~spl svg=A
(-15 -- 15)
.discretize(300)
.collect(cochleoid(1))
.Line
.asLineDrawing
~~~

![](sw/spl/Help/Image/cochleoid-A.svg)

* * *

See also: epitrochoid, hippopede, hypotrochoid

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Cochleoid.html),
_W_
[1](https://en.wikipedia.org/wiki/Cochleoid)
