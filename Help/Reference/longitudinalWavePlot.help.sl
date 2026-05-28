# longitudinalWavePlot

- _longitudinalWavePlot([y₁ y₂ …], d=1)_

Plot data from the list _y_ as longitudinal wave drawing.
The values at _y_ tell the displacement for an equidistant grid.
In one dimension, positive _y_ displace to the right and negative _y_ to the left.

Two periods of a sine function:

~~~spl svg=A
(0 -- 4.pi)
.discretize(50, sin:/1)
.longitudinalWavePlot
~~~

![](Help/Image/longitudinalWavePlot-A.svg)

The same data with _d=2.5_,
equivalent to multiplying _y_ by _d_:

~~~spl svg=B
(0 -- 4.pi)
.discretize(50, sin:/1)
.longitudinalWavePlot(2.5)
~~~

![](Help/Image/longitudinalWavePlot-B.svg)

Transverse plot of the same data set:

~~~spl svg=C
(0 -- 4.pi)
.discretize(100, sin:/1)
.linePlot
~~~

![](Help/Image/longitudinalWavePlot-C.svg)

The zero signal indicates no displacement:

~~~spl svg=D
List(50, 0).longitudinalWavePlot
~~~

![](Help/Image/longitudinalWavePlot-D.svg)

A triangular wave form,
_d=2_:

~~~spl svg=E
(0 -- 2).discretize(50, triangleWave:/1)
.longitudinalWavePlot(2)
~~~

![](Help/Image/longitudinalWavePlot-E.svg)

* * *

See also: linePlot

Guides: Plotting Functions

References:
_W_
[1](https://en.wikipedia.org/wiki/Longitudinal_wave)
