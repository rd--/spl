# inventorySequence

- _inventorySequence(n)_

Answer the first _n_ terms of the inventory sequence [A342585](https://oeis.org/A342585).

> The sequence records the number of zeros thus far in the sequence,
> then the number of ones thus far, then the number of twos thus far
> and so on, until a zero is recorded and the inventory then starts again,
> recording the number of zeros.

Calculate the first few terms:

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

Discrete plot of first few terms:

~~~spl svg=A
99.inventorySequence.discretePlot
~~~

![](sw/spl/Help/Image/inventorySequence-A.svg)

Log scale scatter plot of first few terms:

~~~spl svg=B
333
.inventorySequence
.logScale
.scatterPlot
~~~

![](sw/spl/Help/Image/inventorySequence-B.svg)

* * *

See also: noergaardInfinitySequence

Guides: Integer Sequence Functions

References:
_OEIS_
[1](https://oeis.org/A342585)
