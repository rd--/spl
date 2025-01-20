# listInterpolation

- _listInterpolation(aSequence, aBlock)_

Answer a `Block` that will interpolate into _aSequence_ using the interpolation function defined at _aBlock_,
which should be of either three or five arguments.

Linear interpolation:

~~~spl svg=A
(1 -- 8).functionPlot(
	[3.5 1.5 1.75 1.25 3.75 0 2.5 0.75]
	.listInterpolation(
		linearInterpolation:/3
	)
)
~~~

![](sw/spl/Help/Image/listInterpolation-A.svg)

Cosine interpolation:

~~~spl svg=B
(1 -- 8).functionPlot(
	[3.5 1.5 1.75 1.25 3.75 0 2.5 0.75]
	.listInterpolation(
		cosineInterpolation:/3
	)
)
~~~

![](sw/spl/Help/Image/listInterpolation-B.svg)

For interpolation functions that require points to the left and right,
that is where the number of arguments is five not three,
the leftmost and rightmost values are replicated.
Cubic interpolation:

~~~spl svg=C
(1 -- 8).functionPlot(
	[3.5 1.5 1.75 1.25 3.75 0 2.5 0.75]
	.listInterpolation(
		cubicInterpolation:/5
	)
)
~~~

![](sw/spl/Help/Image/listInterpolation-C.svg)

Catmull-Rom interpolation:

~~~spl svg=D
(1 -- 8).functionPlot(
	[3.5 1.5 1.75 1.25 3.75 0 2.5 0.75]
	.listInterpolation(
		catmullRomInterpolation:/5
	)
)
~~~

![](sw/spl/Help/Image/listInterpolation-D.svg)

No interpolation:

~~~spl svg=E
(1 -- 8).functionPlot(
	[3.5 1.5 1.75 1.25 3.75 0 2.5 0.75]
	.listInterpolation { :y1 :y2 :mu |
		y2
	}
)
~~~

![](sw/spl/Help/Image/listInterpolation-E.svg)

* * *

See also: catmullRomInterpolation, cosineInterpolation, cubicInterpolation, linearInterpolation

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListInterpolation.html)
