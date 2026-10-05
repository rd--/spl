# runLengths

- _runLengths([x₁ x₂ …])_

Answer the run lengths of the sequence _x_.

At `List`:

```
>>> let b = 39.binaryExpansion;
>>> (b, b.runLengths)
([1 0 0 1 1 1], [1 2 3])

>>> 5.binaryExpansion.runLengths
[1 1 1]

>>> let b = 6.binaryExpansion;
>>> let c = b.reverse;
>>> (b, c, b.runLengths, c.runLengths)
([1 1 0], [0 1 1], [2 1], [1 2])
```

At `RunArray`:

```
>>> RunArray([1 2 3], [1 0 1])
>>> .runLengths
[1 2 3]
```

Run lengths of the binary expansion of _n_,
starting with high-order bits,
this is the `binaryRunLengthEncode` method:

~~~spl svg=A
0:35.collect { :n |
	n.binaryExpansion
	.runLengths
}.catenate.discretePlot
~~~

![](Help/Image/runLengths-A.svg)

Run lengths of binary representation of _n_,
OEIS [A101211](https://oeis.org/A101211):

~~~spl svg=B oeis=A101211
1:21.collect { :n |
	let d = n.binaryExpansion;
	d.runLengths
}.catenate.discretePlot
~~~

![](Help/Image/runLengths-B.svg)

Array of run lengths of binary representation of _n_,
OEIS [A227186](https://oeis.org/A227186):

~~~spl svg=C oeis=A227186
0:13.antidiagonalArray { :n :k |
	(n = 0).if {
		0
	} {
		let d = n.binaryExpansion;
		let r = d.reverse.runLengths;
		let c = r.size;
		(k + 1 <= c).if {
			r[k + 1]
		} {
			0
		}
	}
}.catenate.discretePlot
~~~

![](Help/Image/runLengths-C.svg)

* * *

See also: runLengthTransform, runLengthsOf, RunArray

Guides: List Functions
