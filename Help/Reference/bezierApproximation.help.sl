# bezierApproximation

- _bezierApproximation(aList, anInteger)_

Utilise `bezierFunction` to evaluate the Bézier curve specified by _aList_ at _anInteger_ equally spaced indices.
The values answered are exactly on the curve,
the answer is an approximation in the sense of a sampling.

Sample a linear Bézier curve at three points:

```
>>> [0 0; 1 1].bezierApproximation(3)
[0 0; 0.5 0.5; 1 1]
```

Sample a quadratic Bézier curve at three points:

```
>>> [0 0; 0.25 0.75; 1 1]
>>> .bezierApproximation(3)
[0 0; 0.375 0.625; 1 1]
```

Use `bezierApproximation` to calculate sucessively closer approximate arc lengths:

```
>>> [64 128 256 512 1024 2048]
>>> .collect { :n |
>>> 	[0 0; 1 4; 2 -4; 3 0]
>>> 	.bezierApproximation(n)
>>> 	.Line
>>> 	.arcLength
>>> }
[
	5.73707
	5.73830
	5.73860
	5.73867
	5.73869
	5.73870
]
```

Draw a `bezierApproximation` as a `PointCloud`,
indicating the non-uniform distances along the curve between equidistant sampling points:

~~~spl svg=A
[0 0; 1 4; 2 -4; 3 0]
.bezierApproximation(64)
.PointCloud
~~~

![](sw/spl/Help/Image/bezierApproximation-A.svg)

See `bezierTrace` to derive a sampling that is uniformly spaced along the curve.

* * *

See also: BezierCurve, bezierFunction, bezierTrace

Guides: Geometry Functions
