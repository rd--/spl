# functionPlot

- _functionPlot(anObject, aBlock:/1)_

Plot _aBlock_ over the domain _anObject_, which may be discrete or continous.

At `Interval`, a continuous domain that is discretized by `functionPlot`:

~~~
(0 -- 2.pi).functionPlot(sin:/1)
~~~

With block literal:

~~~
(0 -- 15).functionPlot { :x | 2 * x.sin + x }
~~~

Function with varying rate of change:

~~~
(0 -- 10).functionPlot { :x | (30 * x.sin).sin }
~~~

Plot range selection:

~~~
(-1 -- 1).functionPlot { :x | (1 / x).clip(-10, 10) }
~~~

Exclude non-real values:

~~~
(-1 -- 1).functionPlot { :x | let y = x.sqrt; y.isComplex.if { 0 } { y } }
~~~

Function with discontinuities:

~~~
(0 -- 100).functionPlot { :x | x.sqrt.floor }
~~~

Focusing on areas of interest:

~~~
(-1.25 -- 1.25).functionPlot { :x | (x ^ 4) - (x ^ 2) + 1 }
~~~

Log plot:

~~~
(-4 -- 8).functionPlot { :x | x.gamma.abs.log }
~~~

Zero crossings:

~~~
(0 -- 20).functionPlot { :x | (2.sqrt * x).sin + x.sin }
~~~

At `Range`, a discrete domain:

~~~
1:99.functionPlot(log:/1)
~~~

* * *

See also: complexFunctionPlot, discretePlot, linePlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Plot.html)
