# logLinearPlot

- _logLinearPlot(x₁—x₂, f₁)_

Answer a log-linear plot of _f_ as a function of _x_,
also called a semi-logarithmic plot.
The _x_-axis has a logarithmic scale,
the _y_-axis has a linear scale.

Plot the hyperbolic tangent function:

~~~spl svg=A
(1 -- 100).logLinearPlot(tanh:/1)
~~~

![](sw/spl/Help/Image/logLinearPlot-A.svg)

Plot the cosine function:

~~~spl svg=B
(0.1 -- 10).logLinearPlot(cos:/1)
~~~

![](sw/spl/Help/Image/logLinearPlot-B.svg)

Plot the error function:

~~~spl svg=C
(0.01 -- 10).logLinearPlot(erf:/1)
~~~

![](sw/spl/Help/Image/logLinearPlot-C.svg)

Plot the logarithmic function,
which is a straight line in a log-linear plot:

~~~spl svg=D
(0.1 -- 10).logLinearPlot(log:/1)
~~~

![](sw/spl/Help/Image/logLinearPlot-D.svg)

Apply `log` to the _y_ value to draw a log-log plot:

~~~spl svg=E
(1 -- 1E5).logLinearPlot { :x |
	let a = 10 ^ 2;
	let b = ((0J1 * x) ^ 2) + 100;
	let y = (a / b).abs;
	y.log
}
~~~

![](sw/spl/Help/Image/logLinearPlot-E.svg)

Plot the A-weighting curve:

~~~spl svg=F
(10 -- 1E5).logLinearPlot(
	aWeightingCurve:/1
)
~~~

![](sw/spl/Help/Image/logLinearPlot-F.svg)

* * *

See also: exp, linePlot, log

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/LogLinearPlot.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/semilogx.html),
_W_
[1](https://en.wikipedia.org/wiki/Semi-log_plot)
