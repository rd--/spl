# necklaces

- _necklaces(n, k)_

Answer all necklaces of length _n_ from the alphabet _0,1…k_.
Algorithm due to Fredricksen, Kessler and Maiorana.

List of _4,2_ necklaces:

```
>>> necklaces(4, 2)
[
	0 0 0 0;
	0 0 0 1;
	0 0 1 1;
	0 1 0 1;
	0 1 1 1;
	1 1 1 1
]

>>> necklaceCount(4, 2)
6
```

List of _5,2_ necklaces:

```
>>> necklaces(5, 2)
[
	0 0 0 0 0;
	0 0 0 0 1;
	0 0 0 1 1;
	0 0 1 0 1;
	0 0 1 1 1;
	0 1 0 1 1;
	0 1 1 1 1;
	1 1 1 1 1
]

>>> necklaceCount(5, 2)
8
```

List of _6,2_ necklaces:

```
>>> necklaces(6, 2)
[
	0 0 0 0 0 0;
	0 0 0 0 0 1;
	0 0 0 0 1 1;
	0 0 0 1 0 1;
	0 0 0 1 1 1;
	0 0 1 0 0 1;
	0 0 1 0 1 1;
	0 0 1 1 0 1;
	0 0 1 1 1 1;
	0 1 0 1 0 1;
	0 1 0 1 1 1;
	0 1 1 0 1 1;
	0 1 1 1 1 1;
	1 1 1 1 1 1
]

>>> necklaceCount(6, 2)
14
```

Plot the set of eight _5,2_ necklaces:

~~~spl svg=A
necklaces(5, 2)
.collect(necklacePlot:/1)
.reshape([2 4])
.PlotSet
~~~

![](sw/spl/Help/Image/necklaces-A.svg)

Matrix plot of the thirty-six _8,2_ necklaces:

~~~spl svg=B
necklaces(8, 2)
.transpose
.matrixPlot
~~~

![](sw/spl/Help/Image/necklaces-B.svg)

* * *

See also: necklaceCount, necklacePlot

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Necklace.html),
_Python_
[1](https://docs.sympy.org/latest/modules/utilities/iterables.html#sympy.utilities.iterables.necklaces),
_W_
[1](https://en.wikipedia.org/wiki/Necklace_(combinatorics))

Further Reading: Ruskey 1992
