# complexListPlot

- _complexListPlot([z₁ z₂ …])_

Plot complex numbers as points in the complex plane.

~~~spl svg=A
(1:40 + 0J2).sin.complexListPlot
~~~

![](sw/spl/Help/Image/complexListPlot-A.svg)

Plot the spectrum of a discrete time signal:

~~~spl svg=B
(0 -- 13).subdivide(47)
.sawtoothWave
.fourier
.complexListPlot
~~~

![](sw/spl/Help/Image/complexListPlot-B.svg)

* * *

See also: realImaginary, scatterPlot

Guides: Complex Number Functions, Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ComplexListPlot.html)
