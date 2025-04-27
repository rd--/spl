# savitzkyGolayFilter

- _savitzkyGolayFilter(y, m, w)_

Answer a Savitzky-Golay filter with polynomial order _m_ and window size _w_ applied to the signal _y_.

Filter a signal of nine places with polynomial order two and window size five:

```
>>> [2 2 5 2 1 0 1 4 9]
>>> .savitzkyGolayFilter(2, 5)
[
	1.65714 3.17143
	3.54286 2.85714
	0.65714 0.17143
	1.00000 4.00000
	9.00000
]
```

Smooth a normal random variate using a polynomial order of 3 and a window size of 11,
plot both the original and smoothed signals:

~~~spl svg=A
let r = Sfc32(671425);
let d = NormalDistribution(0, 1);
let y = d.randomVariate(r, [34]);
let f = y.savitzkyGolayFilter(3, 11);
[y f].linePlot
~~~

![](sw/spl/Help/Image/savitzkyGolayFilter-A.svg)

* * *

See also: sinc

Guides: Interpolation Functions

References:
_Mathworks_
[1](https://mathworks.com/help/signal/ref/sgolayfilt.html),
_Python_
[1](https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.savgol_filter.html),
_W_
[1](https://en.wikipedia.org/wiki/Savitzky%E2%80%93Golay_filter)
