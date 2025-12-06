# sortTracingComparisons

- _sortTracingComparisons([x₁ x₂ …], f:/2)_

Sort the sequence _x_ using the two-argument sorting block _f_,
which should take a sequence as the first argument and a comparison block as the second.
The left and right arguments at each comparison are stored.
The answer is a list of three places telling
the sorted sequence,
the list of the left arguments,
amd the list of right arguments.

Scatter plot of left sequence when sorting a low-discrepancy van der Corput sequence:

~~~spl svg=A
1:25.vanDerCorputNumber(10)
.sortTracingComparisons(
	sort:/2
).at(2).scatterPlot
~~~

![](sw/spl/Help/Image/sortTracingComparisons-A.svg)

Scatter plot of right sequence when sorting the same low-discrepancy van der Corput sequence:

~~~spl svg=B
1:25.vanDerCorputNumber(10)
.sortTracingComparisons(
	sort:/2
).at(3).scatterPlot
~~~

![](sw/spl/Help/Image/sortTracingComparisons-B.svg)

Step plot of both left and right sequence when sorting the same low-discrepancy van der Corput sequence:

~~~spl svg=C
1:25.vanDerCorputNumber(10)
.sortTracingComparisons(
	sort:/2
).atAll([2, 3]).stepPlot
~~~

![](sw/spl/Help/Image/sortTracingComparisons-C.svg)

Scatter plot of both left and right sequence when sorting a low-discrepancy van der Corput sequence using a merge sort algorithm:

~~~spl svg=D
1:20.vanDerCorputNumber(10)
.sortTracingComparisons(
	mergeSort:/2
).atAll([2, 3]).scatterPlot
~~~

![](sw/spl/Help/Image/sortTracingComparisons-D.svg)

Scatter plot of left sequence when sorting a low-discrepancy van der Corput sequence using Hoare’s quick sort algorithm:

~~~spl svg=E
1:19.vanDerCorputNumber(10)
.sortTracingComparisons(
	quickSort:/2
).at(2).scatterPlot
~~~

![](sw/spl/Help/Image/sortTracingComparisons-E.svg)

The trace reflects the input sequence,
plot traces for sort of two shorter van der Corput sequences:

~~~spl svg=F
[15 18].collect { :n |
	1:n.vanDerCorputNumber(10)
	.sortTracingComparisons(
		quickSort:/2
	).at(2).scatterPlot
}.columnVector.PlotSet
~~~

![](sw/spl/Help/Image/sortTracingComparisons-F.svg)

* * *

See also: sort, sortTracingState

Guides: Sort Functions
