# kroneckerSequence

- _kroneckerSequence(α, n, k₀=0)_

Answer _n_ terms of the Kronecker sequence for _α_,
given initial term,
also called Cranley–Patterson rotation,
_k₀_.

First few terms with _α=φ_:

```
>>> 1.goldenRatio
>>> .kroneckerSequence(5)
[0 0.61803 0.23607 0.85410 0.47214]

>>> (0:4 * 1.goldenRatio) % 1
[0 0.61803 0.23607 0.85410 0.47214]

>>> 1.goldenRatio
>>> .kroneckerSequence(5, 0)
[0 0.61803 0.23607 0.85410 0.47214]

>>> { :a :n |
>>> 	(a[n - 1] + 1.goldenRatio) % 1
>>> }.recurrenceTable([0], 5)
[0 0.61803 0.23607 0.85410 0.47214]
```

Plot a one-dimensional Kronecker sequence with _α=φ_:

~~~spl svg=A
1.goldenRatio
.kroneckerSequence(250)
.scatterPlot
~~~

![](sw/spl/Help/Image/kroneckerSequence-A.svg)

Plot a two-dimensional Kronecker sequence with optimized _α_:

~~~spl svg=B
[
	506598872547596.sqrt / 29147227,
	107882942223468.sqrt / 28993644
].kroneckerSequence(250)
.scatterPlot
~~~

![](sw/spl/Help/Image/kroneckerSequence-B.svg)

Plot a _n_-dimensional Kronecker sequence with _α_ derived from the _n_-th harmonious number:

~~~spl svg=C
let r = 2.harmoniousNumber;
(1 / [r, r ^ 2]).kroneckerSequence(250)
.scatterPlot
~~~

![](sw/spl/Help/Image/kroneckerSequence-C.svg)

* * *

See also: haltonSequence
