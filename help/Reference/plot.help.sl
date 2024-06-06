# plot

- _plot(aVector)_

Plot a sequence:

~~~
1:50.collect(primePi:/1).plot
~~~

C.f. `functionPlot`:

~~~
1:50.functionPlot(primePi:/1)
~~~

Plot a random permutation of the integers up to ninety nine:

~~~
system.randomSample(1:99, 99).plot
~~~

Plot a function:

~~~
(-6 -- 6).subdivide(500).collect { :x | 1 / (4 * x.cos + 5) }.plot
~~~

C.f. `functionPlot`:

~~~
(-6 -- 6).functionPlot { :x | 1 / (4 * x.cos + 5) }
~~~

* * *

See also: discretePlot, functionPlot, linePlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Plot.html)
