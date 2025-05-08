# theilSenEstimator

- _theilSenEstimator(y)_
- _theilSenEstimator(m)_
- _theilSenEstimator(x, y)_

Answers _(y0, m)_ where
_y0_ is the _y_-intercept and
_m_ is the slope.

Linear _y_, _x_ is implicitly _(1 .. n)_:

```
>>> [2 3 4 5 6].theilSenEstimator
[1 1]

>>> [1 2; 2 3; 3 4; 4 5; 5 6]
>>> .theilSenEstimator
[1 1]

>>> let x = [1 2 3 4 5];
>>> let y = [2 3 4 5 6];
>>> x.theilSenEstimator(y)
[1 1]

>>> [1 2; 2 3; 3 4; 4 5; 5 6]
>>> .simpleLinearRegression
[1 1 1]
```

Singular outlier:

```
>>> [2 3 4 20 6 7 8 9 10]
>>> .theilSenEstimator
[1 1]

>>> let x = [1 2 3 4 10 12 18];
>>> let y = [10 14 180 22 46 54 78];
>>> let m = [x y].transposed;
>>> (
>>> 	m.theilSenEstimator,
>>> 	m.simpleLinearRegression
>>> )
(
	[6 4],
	[49.04626, 1.21352, 0.13002]
)
```

Constant _y_:

```
>>> [2 2 2 2].theilSenEstimator
[2 0]
```

Generate synthetic data set and compare Theil-Sen estimator with a simple linear regression:

~~~spl svg=A
let r = Sfc32(5617314);
let n = 99;
let x = [1 .. n];
let y = x.collect { :y |
	(r.nextRandomFloat < ((y / n) ^ 3)).if {
		r.nextRandomFloat * n
	} {
		y + ((r.nextRandomFloat - 0.5) * 10)
	}
};
let l = Line([1 1; n n]);
let p = [x y].transposed.PointCloud;
let [y0, m] = y.theilSenEstimator;
let [slrY0, slrM, _] = x.simpleLinearRegression(y);
[
	Line([1 1; n n]),
	[x y].transposed.PointCloud,
	Line([[0, y0], [n, n * m]]),
	Line([[0, slrY0], [n, n * slrM]])
].LineDrawing
~~~

![](sw/spl/Help/Image/theilSenEstimator-A.svg)

* * *

See also: simpleLinearRegression

References:
_W_
[1](https://en.wikipedia.org/wiki/Theil%E2%80%93Sen_estimator)
