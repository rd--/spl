# simpleLinearRegression

- _simpleLinearRegression(y)_
- _simpleLinearRegression(x, y)_
- _simpleLinearRegression(m)_

Answers _(a, b, r)_ where
_a_ is the _y_-intercept,
_b_ is the slope and
_r_ is the product-moment correlation coefficient.

_r_ is `zero` if there is no linear trend, and `one` if there is a perfect linear fit.

If there are too few points,
or if the slope is infinite,
it is an `error`.

Linear regression over four points:

```
>>> [6 5 7 10].simpleLinearRegression
[3.5 1.4 0.8367]

>>> let x = [1 2 3 4];
>>> let y = [6 5 7 10];
>>> x.simpleLinearRegression(y)
[3.5 1.4 0.8367]

>>> [1 6; 2 5; 3 7; 4 10]
>>> .simpleLinearRegression
[3.5 1.4 0.8367]
```

Linear regression over a data set of average mass as a function of height in a sample of American women:

```
>>> [
>>> 	1.47 52.21;
>>> 	1.50 53.12;
>>> 	1.52 54.48;
>>> 	1.55 55.84;
>>> 	1.57 57.20;
>>> 	1.60 58.57;
>>> 	1.63 59.93;
>>> 	1.65 61.29;
>>> 	1.68 63.11;
>>> 	1.70 64.47;
>>> 	1.73 66.28;
>>> 	1.75 68.10;
>>> 	1.78 69.92;
>>> 	1.80 72.19;
>>> 	1.83 74.46
>>> ].simpleLinearRegression
[-39.0620 61.2722 0.9946]
```

Plot points and linear regression:

~~~spl svg=A
let p = [
	-0.20707 -0.31903;
	0.70667  0.09317;
	1.63739  2.17286;
	2.03117  2.76818;
	3.31874  3.56743;
	5.38201  4.11772;
	6.79971  5.52709;
	6.31814  7.46613;
	8.20829  8.76540;
	8.53994  9.58096
];
let n = p.size;
let [a, b, r] = p.simpleLinearRegression;
let x = n;
let y = (b * x) + a;
[
	p.PointCloud,
	[0 a; x y].Line
].LineDrawing
~~~

![](sw/spl/Help/Image/simpleLinearRegression-A.svg)

* * *

See also: theilSenEstimator

Guides: Statistics Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Simple_linear_regression)
