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

Duration-row permutations of Messiaen’s _Île de Feu II_:

~~~spl svg=C
let p = Permutation[
	12 10 8 6 4 2 1 3 5 7 9 11
];
{ :x |
	x.permute(p)
}.nestList([12, 11 .. 1], 10)
.rectangularPartitionsDrawing
~~~

![](Help/Image/rectangularPartitionsDrawing-C.svg)

* * *

See also: circularPartitionsDrawing, integerPartitions, integerPartitionsTable

Guides: Combinatorial Functions
