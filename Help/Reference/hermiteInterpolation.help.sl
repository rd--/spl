# hermiteInterpolation

- _hermiteInterpolation(y0, y1, y2, y3, mu, tension=0, bias=0)_
- _hermiteInterpolation(tension, bias)_

The full form interpolates at _mu_ between _y1_ and _y2_ using the specified _tension_ and _bias_ parameters,
assuming equally spaced _y_.
With tension and bias values of `zero` the answer is equal to `catmullRomInterpolation`.

```
>>> hermiteInterpolation(1, 2, 3, 5, 0.5, 0, 0)
2.4375

>>> catmullRomInterpolation(1, 2, 3, 5, 0.5)
2.4375
```

The binary form anwers a five argument block specialised to the specified _tension_ and _bias_ parameters.

Hermite impulse response, tension of negative three:

~~~spl svg=A
(1 -- 5).functionPlot(
	[0 0 1 0 0]
	.listInterpolation(
		hermiteInterpolation(-3, 0)
	)
)
~~~

![](sw/spl/Help/Image/hermiteInterpolation-A.svg)

Hermite impulse response, tension of positive three:

~~~spl svg=B
(1 -- 5).functionPlot(
	[0 0 1 0 0]
	.listInterpolation(
		hermiteInterpolation(3, 0)
	)
)
~~~

![](sw/spl/Help/Image/hermiteInterpolation-B.svg)

Hermite impulse response, tension of negative one and bias of two-thirds:

~~~spl svg=C
(1 -- 5).functionPlot(
	[0 0 1 0 0]
	.listInterpolation(
		hermiteInterpolation(-1, 2/3)
	)
)
~~~

![](sw/spl/Help/Image/hermiteInterpolation-C.svg)

* * *

See also: catmullRomInterpolation, cosineInterpolation, cubicInterpolation, linearInterpolation, listInterpolation

References:
_W_
[1](https://en.wikipedia.org/wiki/Hermite_interpolation)
[2](https://en.wikipedia.org/wiki/Cubic_Hermite_spline)
