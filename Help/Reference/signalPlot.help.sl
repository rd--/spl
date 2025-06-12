# signalPlot

- _signalPlot(d, i)_

Plot the signal data at _d_,
which should be of the form _[u₁ u₂ …; v₁ v₂ …; …]_,
and lie in the interval _i_,
which is set to _(-1,1)_ if not specified.

The channels of the signal,
_(u,v,…)_,
are plotted horizontally aligned and vertically displaced from each other.

Plot cosine, sawtooth, square and triangle signals:

~~~spl svg=A
let x = [0, 0.02 .. 4];
[
	x.cosineWave,
	x.sawtoothWave,
	x.squareWave,
	x.triangleWave
].signalPlot
~~~

![](sw/spl/Help/Image/signalPlot-A.svg)

The sawtooth signal above is uni-polar,
below it is scaled to be descending and bi-polar:

~~~spl svg=B
let x = [0, 0.02 .. 3];
[
	x.cosineWave,
	x.sawtoothWave * -2 + 0.5
].signalPlot
~~~

![](sw/spl/Help/Image/signalPlot-B.svg)

* * *

See also: linePlot

Guides: Plotting Functions
