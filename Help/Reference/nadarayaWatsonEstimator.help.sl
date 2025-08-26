# nadarayaWatsonEstimator

- _nadarayaWatsonEstimator(i, x, y, h, k:/1)_

The Nadaraya-Watson estimator.

~~~spl svg=A
let r = Sfc32(738164);
let i = [0, 0.25 .. 4.pi];
let n = i.size;
let d = NormalDistribution(0, 1);
let p = d.randomVariate(r, [n]) * 0.5;
let q = d.randomVariate(r, [n]);
let m = { :x | x.cos };
let x = i + p;
let y = x.collect(m:/1) + q;
let j = [0, 0.01 .. 4.pi];
let e = j.nadarayaWatsonEstimator(
	x,
	y,
	0.6,
	1.gaussianKernel
);
[
	[x, y].transpose.PointCloud,
	[i, i.collect(m:/1)].transpose.Line,
	[j, e].transpose.Line
].LineDrawing
~~~

![](sw/spl/Help/Image/nadarayaWatsonEstimator-A.svg)

* * *

See also: NormalDistribution, simpleLinearRegression, theilSenEstimator

Guides: Statistics Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Kernel_regression)

Further Reading: Nadaraya 1964, Watson 1964
