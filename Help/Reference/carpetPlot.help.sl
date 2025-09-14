# carpetPlot

- _carpetPlot(f:/2, [a b], [i j])_

Answer a carpet plot of the binary function _f_,
over the variables _a_ and _b_,
linearly interpolated to _i_ and _j_ places.

~~~spl svg=A
{ :a :b |
	[
		(a * b).sqrt,
		(b ^ (3 / 2)) / a
	]
}.carpetPlot(
	[
		4 5 6 7 8;
		10 11 12 13 14 15
	],
	[25 30]
)
~~~

![](sw/spl/Help/Image/carpetPlot-A.svg)

The identity function is a rectangular grid,
here over the same _a_ and _b_ at the same interpolation points:

~~~spl svg=B
{ :a :b | [a, b] }.carpetPlot(
	[
		4 5 6 7 8;
		10 11 12 13 14 15
	],
	[25 30]
)
~~~

![](sw/spl/Help/Image/carpetPlot-B.svg)

* * *

See also: conformalPlot, linePlot, parametricPlot, resample

Guides: Plotting Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Carpet_plot)
