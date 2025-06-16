# discreteFunctionPlot

- _discreteFunctionPlot([x₁ x₂ …], f₁)_

Plot the unary function _f_ over the domain _x_.

Plot the `pochhammer` function over a `Range` of integer values: 

~~~spl svg=A
(-23 .. 23).discreteFunctionPlot { :a |
	pochhammer(a, 3)
}
~~~

![](sw/spl/Help/Image/discreteFunctionPlot-A.svg)

* * *

See also: discretePlot, functionPlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Plot.html)

Categories: Plotting
