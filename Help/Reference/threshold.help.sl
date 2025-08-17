# threshold

- _threshold(c, epsilon)_

Thresholds the collection _c_ by replacing values close to `zero` by `zero`.

Zero out elements that are very close to 0:

```
>>> [
>>> 	1 1E-1 1E-2 1E-8 1E-11
>>> ].threshold(10E-9)
[1 1E-1 1E-2 1E-8 0]

>>> [1 1 0 0 0]
>>> .fourier
>>> .inverseFourier
>>> .threshold
[1 1 0 0 0]
```

Zero out elements with absolute value smaller than 3/2:

```
>>> [-3 1 -2 0 2 -1 0 1 -3 3 2]
>>> .threshold(3/2)
[-3 0 -2 0 2 0 0 0 -3 3 2]
```

Threshold a matrix:

```
>>> [0 0.2 0.4; 0.6 0.8 1].threshold(0.5)
[
	0.0 0.0 0.0;
	0.6 0.8 1.0
]
```

Plot thresholding:

~~~spl svg=A
let l = (-1 -- 1).subdivide(100);
l.threshold(0.3).linePlot
~~~

![](sw/spl/Help/Image/threshold-A.svg)

* * *

See also: abs, isCloseTo, isVeryCloseTo, zero

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Threshold.html)
