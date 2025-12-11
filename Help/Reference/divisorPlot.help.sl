# divisorPlot

- _divisorPlot([i₁ i₂ …], [j₁ j₂ …])_

A scatter plot indicating for each integer _i_ if it is divisible by each integer _j_.
The integers _i_ are drawn on the _x_ axis,
the integers _j_ on the _y_ axis.
Ordinarily _i_ and _j_ will be ranges of consecutive integers.

Plot for _i=60:100_ and _j=1:12_:

~~~spl svg=A
divisorPlot(60:100, 1:12)
~~~

![](sw/spl/Help/Image/divisorPlot-A.svg)

A later section of the array,
the divisors are negated and hence the _y_ axis inverted:

~~~spl svg=B
divisorPlot(151008:151140, -120:-20)
~~~

![](sw/spl/Help/Image/divisorPlot-B.svg)

Plot either side of _12!_ (479001600):

~~~spl svg=C
divisorPlot(
	479001500:479001700,
	36:128
)
~~~

![](sw/spl/Help/Image/divisorPlot-C.svg)

Plot the region either side of one million,
for divisors either side of one thousand:

~~~spl svg=D
divisorPlot(
	(1E6 - 300 .. 1E6 + 300),
	800:1200
)
~~~

![](sw/spl/Help/Image/divisorPlot-D.svg)

Plot region leading up to _(i=576,j=24)_:

~~~spl svg=E
divisorPlot(
	420:580,
	12:42
)
~~~

![](sw/spl/Help/Image/divisorPlot-E.svg)

* * *

See also: divisible, scatterPlot

Guides: Plotting Functions
