# plot

- _plot(aSound, aNumber)_

Render _aNumber_ seconds of _aSound_,
which may have multiple channels,
and plot the answer.

Plot `Latch` of `Dust`:

~~~
let d = Dust([1 5] * 100);
Latch(d, d).plot(0.1)
~~~

* * *

See also: discretePlot, functionPlot, linePlot, scatterPlot

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Plot.html)

Categories: Plotting
