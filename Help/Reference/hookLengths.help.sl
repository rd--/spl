# hookLengths

- _hookLengths(p)_

Answer a tableau of shape _p_ with the cells filled in with the hook lengths,
one more than the sum of the number of cells to the right and below the cell.

```
>>> [2 2 1].hookLengths
[4 2; 3 1; 1]

>>> [3 3].hookLengths
[4 3 2; 3 2 1]

>>> [3 2 1].hookLengths
[5 3 1; 3 1; 1]

>>> [2 2].hookLengths
[3 2; 2 1]

>>> [5].hookLengths
[[5 4 3 2 1]]
```

Plot partition array for the products of the hook lengths corresponding to the partitions of _n_,
OEIS [A263003](https://oeis.org/A263003):

~~~spl svg=A
1:11.collect { :n |
	n.integerPartitions.collect { :p |
		p.hookLengths.catenate.product
	}
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/hookLengths-A.svg)

Row sums of the partition array,
OEIS [A263004](https://oeis.org/A263004):

```
>>> 1:9.collect { :n |
>>> 	n.integerPartitions.collect { :p |
>>> 		p.hookLengths.catenate
>>> 		.product
>>> 	}.sum
>>> }
[1 4 15 76 368 2365 14892 116236 966064]
```

* * *

See also: conjugatePartition, ferrersDiagram, hookLengthFormula

Guides: Combinatorial Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/HookLengthFormula.html),
_OEIS_
[1](https://oeis.org/A263003),
_Python_
[1](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/partition.html#sage.combinat.partition.Partition.hook_lengths),
_W_
[1](https://en.wikipedia.org/wiki/Hook_length_formula)
