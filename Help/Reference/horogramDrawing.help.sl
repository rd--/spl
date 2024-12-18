# horogramDrawing

- _horogramDrawing(aList)_

Answer a `LineDrawing` showing a circular Wilson horogram of the interval sequences at _aList_,
which should each sum to the same value.

`zero`,
and equivalently the period,
points upwards,
and intervals increase clockwise:

~~~spl svg=A
[
	4;
	1 3;
	1 1 2;
	1 1 1 1
].horogramDrawing
~~~

![](sw/spl/Help/Image/horogramDrawing-A.svg)

A drawing of the _5/12_ moment of symmetry scale construction:

~~~spl svg=B
[
	5 7;
	5 5 2;
	3 2 3 2 2;
	1 2 2 1 2 2 2;
].horogramDrawing
~~~

![](sw/spl/Help/Image/horogramDrawing-B.svg)

* * *

See also: Circle, Line, LineDrawing, momentOfSymmetry

_Anaphoria_
[1](https://www.anaphoria.com/wilsonscaletree.html)
[2](https://www.anaphoria.com/hrgm.pdf),
_Xenharmonic_
[1](https://en.xen.wiki/w/Horogram)
