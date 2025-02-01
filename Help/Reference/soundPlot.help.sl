# soundPlot

- _soundPlot(aSound, aNumber)_

Render _aNumber_ seconds of _aSound_,
which may have multiple channels,
and plot the answer.

Plot `Latch` of `Dust`:

~~~spl ui
let d = Dust([1 5] * 100);
Latch(d, d).soundPlot(0.1)
~~~

* * *

See also: discretePlot, functionPlot, linePlot, scatterPlot

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/Function.html#-plot)

Categories: Plotting
