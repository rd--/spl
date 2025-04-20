# stackedListPlot

- _stackedListPlot([l₁, l₂ …])_

Plots lines for each of the data _l_,
with the _i_-th curve being the accumulation of values in layers 1 through _i_.

Plot a stacked list of  values:

~~~spl svg=A
[
	3 2 1 6 4 7 7 2 3 1;
	7 8 8 3 5 9 10 3 10 10;
	10 2 4 8 4 10 8 4 5 3
].stackedListPlot
~~~

![](sw/spl/Help/Image/stackedListPlot-A.svg)

* * *

See also: linePlot

Guides: Plotting Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/StackedListPlot.html)
