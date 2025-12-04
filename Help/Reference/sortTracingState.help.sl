# sortTracingState

- _sortTracingState([x₁ x₂ …], f:/1)_

Sort the sequence _x_ using the two-argument sorting block _f_,
which should take a sequence as the first argument and a monitor block as the second.
The monitored states are stored,
the answer matrix gives each state in sequence.

Matrix plot of Hoare’s quick sort algorithm:

~~~spl svg=A
Sfc32(387914)
.randomPermutationList(11)
.sortTracingState(
	quickSortHoareWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-A.svg)

Matrix plot of a merge sort algorithm:

~~~spl svg=B
Sfc32(387914)
.randomPermutationList(11)
.sortTracingState(
	mergeSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-B.svg)

Matrix plot of an insertion sort algorithm:

~~~spl svg=C
Sfc32(387914)
.randomPermutationList(11)
.sortTracingState(
	insertionSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-C.svg)

Matrix plot of a selection sort algorithm:

~~~spl svg=D
Sfc32(387914)
.randomPermutationList(11)
.sortTracingState(
	selectionSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-D.svg)

Matrix plot of a cycle sort algorithm:

~~~spl svg=E
Sfc32(387914)
.randomPermutationList(11)
.sortTracingState(
	cycleSortWithMonitor:/2
).replaceNil(0).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-E.svg)

Matrix plot of a shell sort algorithm,
note that the intermediate state contains `nil`:

~~~spl svg=F
Sfc32(387914)
.randomPermutationList(11)
.sortTracingState(
	shellSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-F.svg)

Matrix plot of a shuffle sort algorithm:

~~~spl svg=G
Sfc32(387914)
.randomPermutationList(9)
.sortTracingState(
	shuffleSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-G.svg)

Matrix plot of a radix sort algorithm:

~~~spl svg=H
Sfc32(387914)
.randomPermutationList(7)
.sortTracingState(
	radixSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-H.svg)

Matrix plot of an odd-even sort algorithm:

~~~spl svg=I
Sfc32(387914)
.randomPermutationList(9)
.sortTracingState(
	oddEvenSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-I.svg)

Matrix plot of a comb sort algorithm:

~~~spl svg=J
Sfc32(387914)
.randomPermutationList(11)
.sortTracingState(
	combSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-J.svg)

Matrix plot of a bubble sort algorithm:

~~~spl svg=K
Sfc32(387914)
.randomPermutationList(9)
.sortTracingState(
	bubbleSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-K.svg)

Matrix plot of a bitonic sort algorithm:

~~~spl svg=L
Sfc32(387914)
.randomPermutationList(8)
.sortTracingState(
	bitonicSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-L.svg)

Matrix plot of a gnome sort algorithm:

~~~spl svg=M
Sfc32(387914)
.randomPermutationList(9)
.sortTracingState(
	gnomeSortWithMonitor:/2
).transpose.matrixPlot
~~~

![](sw/spl/Help/Image/sortTracingState-M.svg)

* * *

See also: sort, sortTracingComparisons

Guides: Sort Functions
