# cubicInterpolation

- _cubicInterpolation(y0, y1, y2, y3, mu)_

Interpolate at _mu_ between _y1_ and _y2_,
assuming equally spaced _y_.

```
>>> cubicInterpolation(1, 2, 3, 5, 0.5)
2.375
```

Cubic impulse response:

~~~spl svg=A
(1 -- 5).functionPlot(
	[0 0 1 0 0]
	.listInterpolation(
		cubicInterpolation:/5
	)
)
~~~

![](sw/spl/Help/Image/cubicInterpolation-A.svg)

* * *

See also: catmullRomInterpolation, cosineInterpolation, hermiteInterpolation, linearInterpolation, listInterpolation
