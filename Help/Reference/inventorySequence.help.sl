# inventorySequence

- _inventorySequence(n)_

Answer the first _n_ terms of the inventory sequence,
[A342585](https://oeis.org/A342585).

> The sequence records the number of zeroes thus far in the sequence,
> then the number of ones thus far, then the number of twos thus far
> and so on, until a zero is recorded and the inventory then starts again,
> recording the number of zeroes.

Calculate the first few terms,
OEIS [A342585](https://oeis.org/A342585):

```
>>> 37.inventorySequence
[
	0
	1 1 0
	2 2 2 0
	3 2 4 1 1 0
	4 4 4 1 4 0
	5 5 4 1 6 2 1 0
	6 7 5 1 6 3 3 1 0
]
```

Positions of zeroes,
OEIS [A343880](https://oeis.org/A343880):

```
>>> 200.inventorySequence.indicesOf(0)
[
	  1   4   8  14  20
	 28  37  46  57  69
	 82  95 110 125 142
	159 177 196
]
```

The inventory sequence,
discrete plot,
OEIS [A342585](https://oeis.org/A342585):

~~~spl svg=A oeis=A342585
99.inventorySequence.discretePlot
~~~

![](Help/Image/inventorySequence-A.svg)

The inventory sequence,
log scale scatter plot,
OEIS [A342585](https://oeis.org/A342585):

~~~spl svg=B oeis=A342585
333.inventorySequence
.scatterPlot.logScale
~~~

![](Help/Image/inventorySequence-B.svg)

* * *

See also: noergaardInfinitySequence

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A342585)
