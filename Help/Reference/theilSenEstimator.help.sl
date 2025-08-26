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
>>> let m = [x y].transpose;
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
	let a = r.nextRandomFloat;
	let b = r.nextRandomFloat;
	(a < ((y / n) ^ 3)).if {
		b * n
	} {
		y + ((b - 0.5) * 10)
	}
};
let l = Line([1 1; n n]);
let p = [x y].transpose.PointCloud;
let [y0, m] = y.theilSenEstimator;
let [y0L, mL, _] = y.simpleLinearRegression;
[
	Line([1 1; n n]),
	[x y].transpose.PointCloud,
	Line([[0, y0], [n, n * m]]),
	Line([[0, y0L], [n, n * mL]])
].LineDrawing
~~~

![](sw/spl/Help/Image/theilSenEstimator-A.svg)

* * *

See also: nadarayaWatsonEstimator, simpleLinearRegression

Guides: Statistics Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Theil%E2%80%93Sen_estimator)

Further Reading: Sen 1968, Theil 1950
