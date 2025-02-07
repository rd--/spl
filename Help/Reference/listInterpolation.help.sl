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

No interpolation, use next sample point:

~~~spl svg=E
(1 -- 8).functionPlot(
	[3.5 1.5 1.75 1.25 3.75 0 2.5 0.75]
	.listInterpolation { :y1 :y2 :mu |
		y2
	}
)
~~~

![](sw/spl/Help/Image/listInterpolation-E.svg)

No interpolation, use previous sample point:

~~~spl svg=F
(1 -- 8).functionPlot(
	[3.5 1.5 1.75 1.25 3.75 0 2.5 0.75]
	.listInterpolation { :y1 :y2 :mu |
		y1
	}
)
~~~

![](sw/spl/Help/Image/listInterpolation-F.svg)

No interpolation, use nearest sample point:

~~~spl svg=G
(1 -- 8).functionPlot(
	[3.5 1.5 1.75 1.25 3.75 0 2.5 0.75]
	.listInterpolation { :y1 :y2 :mu |
		(mu < 0.5).if { y1 } { y2 }
	}
)
~~~

![](sw/spl/Help/Image/listInterpolation-G.svg)

Compare linear and Catmull-Rom interpolation using test data that connects multiple flat regions:

~~~spl svg=H
let l = [-1 -1 -1 0 1 1 1];
let n = l.size;
(1 -- n).functionPlot(
	[
		linearInterpolation:/3,
		catmullRomInterpolation:/5
	].collect { :each |
		l.listInterpolation(each)
	}
)
~~~

![](sw/spl/Help/Image/listInterpolation-H.svg)

* * *

See also: blend, catmullRomInterpolation, cosineInterpolation, cubicInterpolation, linearInterpolation

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ListInterpolation.html)
