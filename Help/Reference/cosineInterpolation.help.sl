# cosineInterpolation

- _cosineInterpolation(y1, y2, mu)_

Interpolate at _mu_ between _y1_ and _y2_.

```
>>> cosineInterpolation(2, 3, 0.5)
2.5
```

Cosine impulse response:

~~~spl svg=A
(1 -- 5).functionPlot(
	[0 0 1 0 0]
	.listInterpolation(
		cosineInterpolation:/3
	)
)
~~~

![](sw/spl/Help/Image/cosineInterpolation-A.svg)

* * *

See also: catmullRomInterpolation, cubicInterpolation, hermiteInterpolation, linearInterpolation, listInterpolation
