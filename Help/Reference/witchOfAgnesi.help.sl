# witchOfAgnesi

- _witchOfAgnesi(a)_

A curve studied by Maria Agnesi in 1748.

Plot:

~~~spl svg=A
(-2 -- 2).functionPlot(
	witchOfAgnesi(1)
)
~~~

![](sw/spl/Help/Image/witchOfAgnesi-A.svg)

Draw with circle and bounding box:

~~~spl svg=B
let t = (-4 -- 4).subdivide(100);
let c = t.collect(
	witchOfAgnesi(1)
);
[
	Circle([0 1], 1),
	c.Line,
	Rectangle([-8 -8], [8 8])
].LineDrawing
~~~

![](sw/spl/Help/Image/witchOfAgnesi-B.svg)

* * *

See also: Circle

Guides: Curve Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/WitchofAgnesi.html),
_W_
[1](https://en.wikipedia.org/wiki/Witch_of_Agnesi)
