# catmullRomInterpolation

- _catmullRomInterpolation(y0, y1, y2, y3, mu)_

Interpolate at _mu_ between _y1_ and _y2_.

```
>>> catmullRomInterpolation(1, 2, 3, 5, 0.5)
2.4375
```

Catmull-Rom impulse response:

~~~spl svg=A
(1 -- 5).functionPlot(
	[0 0 1 0 0]
	.listInterpolation(
		catmullRomInterpolation:/5
	)
)
~~~

![](sw/spl/Help/Image/catmullRomInterpolation-A.svg)

* * *

See also: cosineInterpolation, cubicInterpolation, hermiteInterpolation, linearInterpolation, listInterpolation
