# poincarePlot

- _poincarePlot([x₁ x₂ …], n=1)_

Answer a Poincaré plot of the values at _x_ at time delay _n_.
A Poincaré plot is also called a `lagPlot`.

Poincaré plot of a harmonic oscillation with two frequencies:

~~~spl svg=A
(0 -- 4.pi).subdivide(200).collect { :x |
	(x * 3).sin + (x * 7).sin
}.poincarePlot
~~~

![](sw/spl/Help/Image/poincarePlot-A.svg)

* * *

See also: lagPlot, recurrenceMatrix, scatterPlot

Guides: Plotting Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Poincar%C3%A9_plot)
