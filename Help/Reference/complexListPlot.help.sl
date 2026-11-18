# complexListPlot

- _complexListPlot([z₁ z₂ …])_

Plot complex numbers as points in the complex plane.

Plot `sin`:

~~~spl svg=A
([1.0 .. 40.0] + 0J2).sin
.complexListPlot
~~~

![](Help/Image/complexListPlot-A.svg)

Plot the spectrum of a discrete time signal:

~~~spl svg=B
(0.0 -- 13.0).subdivide(47L)
.sawtoothWave
.fourier
.complexListPlot
~~~

![](Help/Image/complexListPlot-B.svg)

* * *

See also: complexPlot, realImaginary, scatterPlot

Guides: Complex Number Functions, Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ComplexListPlot.html)
