# rectangularPartitionsDrawing

- _rectangularPartitionsDrawing(p)_

Answer a `LineDrawing` showing a rectangular drawing of the partitions at the list _p_,
which should each `sum` to the same value.

`zero` is at the left,
intervals increase rightwards until the period,
which is at the right,
and rows are descending:

~~~spl svg=A
6.integerPartitions
.rectangularPartitionsDrawing
~~~

![](Help/Image/rectangularPartitionsDrawing-A.svg)

The partitions need not be integers,
draw a diagram of the first five octaves of the harmonic series:

~~~spl svg=B
1:32.ratios
.ratioToCents
.takeList(
	[1 2 4 8 16]
).collect(
	normalizeSum:/1
).rectangularPartitionsDrawing
~~~

![](Help/Image/rectangularPartitionsDrawing-B.svg)

* * *

See also: circularPartitionsDrawing, integerPartitions, integerPartitionsTable

Guides: Combinatorial Functions
