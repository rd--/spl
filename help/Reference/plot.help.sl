# plot

- _plot(aVector)_

Plot a sequence:

~~~
1:50.collect(primePi:/1).plot
~~~

Plot a random permutation of the integers up to ninety nine:

~~~
1:99.randomSample(99).plot
~~~

Plot a table:

~~~
(0, 0.01 .. 1).collect { :x |
	x - (x ^ 2)
}.scatterPlot
~~~

* * *

See also: discretePlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Plot.html)
