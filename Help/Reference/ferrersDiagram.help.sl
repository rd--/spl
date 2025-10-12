# ferrersDiagram

- _ferrersDiagram(p)_

Answer a `LineDrawing` of the Ferrers diagram of the partition _p_.

The Ferrers diagram of a partition of fifteen:

~~~spl svg=A
[6 3 3 2 1].ferrersDiagram
~~~

![](sw/spl/Help/Image/ferrersDiagram-A.svg)

The conjugate partition of _(6,3,3,2,1)_:

~~~spl svg=B
[5 4 3 1 1 1].ferrersDiagram
~~~

![](sw/spl/Help/Image/ferrersDiagram-B.svg)

A self-conjugate partition:

~~~spl svg=C
[5 2 1 1 1].ferrersDiagram
~~~

![](sw/spl/Help/Image/ferrersDiagram-C.svg)

An twenty-one part integer partition of ninety-six:

~~~spl svg=D
[
	20 16 12  9  5  4  4  4  2  2
	2  2  2  2  2  2  2  1  1  1
	1
].ferrersDiagram
~~~

![](sw/spl/Help/Image/ferrersDiagram-D.svg)

* * *

See also: Disk, integerPartitions, LineDrawing

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/FerrersDiagram.html),
_W_
[1](https://en.wikipedia.org/wiki/Ferrers_diagram)
