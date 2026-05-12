# PlotSet

- _PlotSet(m)_
- _PlotSet(c, [m n])_

A `Type` representing a set of data plots.

In the unary case _m_ must be a regular matrix of `Plot` values,
however `nil` values are allowed as missing entries.

In the binary case the collection _c_ will be be reshaped to have _m_ rows and _n_ columns,
missing items will be set to `nil`.

Plot multiplication table for numbers coprime to _k_,
modulo _k_,
for _k=20,21,22_:

~~~spl svg=A
[20 21 22].collect { :k |
	let x = 1:k.select { :n |
		n.isCoprime(k)
	};
	{ :i :j |
		i * j % k
	}.table(x, x)
	.colouredMatrixPlot
}.PlotSet([3 1])
~~~

![](Help/Image/PlotSet-A.svg)

* * *

See also: Plot

Guides: Plotting Functions
