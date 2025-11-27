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

Plot:

~~~spl svg=A
0:35.collect { :n |
	n.binaryExpansion
	.runLengthsOf(1)
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/runLengthsOf-A.svg)

* * *

See also: runLengthTransform, RunArray

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Run.html),
_OEIS_
[1](https://oeis.org/A245562)
