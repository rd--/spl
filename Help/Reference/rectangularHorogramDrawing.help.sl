# rectangularHorogramDrawing

- _rectangularHorogramDrawing(aList)_

Answer a `LineDrawing` showing a rectangular Wilson horogram of the interval sequences at _aList_,
which should each sum to the same value.

`zero` is at the left,
intervals increase rightwards until the period,
which is at the right,
and rows are descending:

~~~spl svg=A
[
	4;
	1 3;
	1 1 2;
	1 1 1 1
].rectangularHorogramDrawing
~~~

![](sw/spl/Help/Image/rectangularHorogramDrawing-A.svg)

A drawing of the _5/12_ moment of symmetry scale construction:

~~~spl svg=B
[
	5 7;
	5 5 2;
	3 2 3 2 2;
	1 2 2 1 2 2 2;
].rectangularHorogramDrawing
~~~

![](sw/spl/Help/Image/rectangularHorogramDrawing-B.svg)

A drawing of the first eleven steps of an irrational moment of symmetry scale construction:

~~~spl svg=C
0.420422529
.momentOfSymmetry(1, 11)
.rectangularHorogramDrawing
~~~

![](sw/spl/Help/Image/rectangularHorogramDrawing-C.svg)

* * *

See also: horogramDrawing, horogramTable, Line, LineDrawing, momentOfSymmetry, rectangularPartitionsDrawing

_Anaphoria_
[1](https://www.anaphoria.com/wilsonscaletree.html)
[2](https://www.anaphoria.com/hrgm.pdf),
_Xenharmonic_
[1](https://en.xen.wiki/w/Horogram)
