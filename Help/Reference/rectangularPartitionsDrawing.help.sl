# rectangularPartitionsDrawing

- _rectangularPartitionsDrawing(aList)_

Answer a `LineDrawing` showing a rectangular drawing of the partitions at _aList_,
which should each `sum` to the same value.

`zero` is at the left,
intervals increase rightwards until the period,
which is at the right,
and rows are descending:

~~~spl svg=A
6.integerPartitions
.rectangularPartitionsDrawing
~~~

![](sw/spl/Help/Image/rectangularPartitionsDrawing-A.svg)

* * *

See also: circularPartitionsDrawing, integerPartitions, integerPartitionsTable
