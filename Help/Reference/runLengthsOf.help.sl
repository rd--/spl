# runLengthsOf

- _runLengthsOf([x₁ x₂ …], y)_

Answer the run lengths of the item _y_ in the sequence _x_.

At `List`:

```
>>> let b = 39.binaryExpansion;
>>> (b, b.runLengthsOf(1))
([1 0 0 1 1 1], [1 3])
```

At `RunArray`:

```
>>> RunArray([1 2 3], [1 0 1])
>>> .runLengthsOf(1)
[1 3]
```

List lengths of runs of ones in binary expansion of _n_,
starting with high-order bits,
OEIS [A245562](https://oeis.org/A245562):

```
>>> 0:21.collect { :n |
>>> 	n.binaryExpansion
>>> 	.runLengthsOf(1)
>>> }
[
	;
	1;
	1;
	2;
	1;
	1 1;
	2;
	3;
	1;
	1 1;
	1 1;
	1 2;
	2;
	2 1;
	3;
	4;
	1;
	1 1;
	1 1;
	1 2;
	1 1;
	1 1 1
]
```

List lengths of runs of ones in binary expansion of _n_,
starting with high-order bits,
OEIS [A245562](https://oeis.org/A245562):

~~~spl svg=A oeis=A245562
0:35.collect { :n |
	n.binaryExpansion
	.runLengthsOf(1)
}.catenate.discretePlot
~~~

![](Help/Image/runLengthsOf-A.svg)

Select _n_ if every one in the binary expansion is next to at least one other one,
OEIS [A144795](https://oeis.org/A144795):

~~~spl svg=B oeis=A144795
1:350.select { :n |
	n.binaryExpansion
	.runLengthsOf(1)
	.min >= 2
}.discretePlot
~~~

![](Help/Image/runLengthsOf-B.svg)

The least length of runs of ones in the binary expansion of _n_,
OEIS [A144790](https://oeis.org/A144790):

~~~spl svg=C oeis=A144790
1:65.collect { :n |
	n.binaryExpansion
	.runLengthsOf(1)
	.min
}.stepPlot
~~~

![](Help/Image/runLengthsOf-C.svg)

Length of longest contiguous block of ones in the binary expansion of _n_,
OEIS [A038374](https://oeis.org/A038374):

~~~spl svg=D oeis=A038374
1:65.collect { :n |
	n.binaryExpansion
	.runLengthsOf(1)
	.max
}.stepPlot
~~~

![](Help/Image/runLengthsOf-D.svg)

The least length of runs of zeroes in the binary expansion of _n_,
OEIS [A144789](https://oeis.org/A144789):

~~~spl svg=E oeis=A144789
1:65.collect { :n |
	let b = n.binaryExpansion;
	let r = b.runLengthsOf(0);
	r.ifEmpty {
		0
	} {
		r.min
	}
}.stepPlot
~~~

![](Help/Image/runLengthsOf-E.svg)

* * *

See also: runLengthTransform, RunArray

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Run.html),
_OEIS_
[1](https://oeis.org/A245562)
