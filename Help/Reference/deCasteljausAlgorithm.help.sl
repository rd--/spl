# deCasteljausAlgorithm

- _deCasteljausAlgorithm(aList, aNumber)_

Calculate the point along the curve given by _aList_,
which should be a list of cartesian coordinates,
at the location given by _aNumber_,
which should lie between `zero` and `one`,
using de Casteljaus algorithm.

Draw a quadratic Bézier curve using de Casteljaus algorithm:

~~~spl svg=A
(0 -- 1).functionPlot { :x |
	[0 0; 1 1; 2 0]
	.deCasteljausAlgorithm(x)
}
~~~

![](sw/spl/Help/Image/deCasteljausAlgorithm-A.svg)

Draw a cubic Bézier curve:

~~~spl svg=B
(0 -- 1).functionPlot { :x |
	[0 0; 1 1; 2 -1; 3 0]
	.deCasteljausAlgorithm(x)
}
~~~

![](sw/spl/Help/Image/deCasteljausAlgorithm-B.svg)

Draw the same cubic Bézier curve using only a small number of divisions:

~~~spl svg=C
(0, 0.1 .. 1).functionPlot { :x |
	[0 0; 1 1; 2 -1; 3 0]
	.deCasteljausAlgorithm(x)
}
~~~

![](sw/spl/Help/Image/deCasteljausAlgorithm-C.svg)

* * *

See also: BezierCurve, cubicBezierFunctionAt, quadraticBezierFunctionAt

Guides: Geometry Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/De_Casteljau%27s_algorithm)
