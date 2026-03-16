# alternatingSum

- _alternatingSum([x₁ x₂ …])_

Answer the alternating sum of _x_,
which is _x₁-x₂+x₃-x₄+x₅…_.

```
>>> [5 7 8 9].alternatingSum
-3

>>> 5 - 7 + 8 - 9
-3

>>> [9 8 7 5].alternatingSum
3

>>> 9 - 8 + 7 - 5
3
```

Alternating sum of reverse of decimal expansion of _n_,
OEIS [A055017](https://oeis.org/A055017):

~~~spl svg=A oeis=A055017
0:300.collect { :n |
	n.integerDigits
	.reverse
	.alternatingSum
}.scatterPlot
~~~

![](sw/spl/Help/Image/alternatingSum-A.svg)

Alternating sum of decimal expansion of _n_,
OEIS [A225693](https://oeis.org/A225693):

~~~spl svg=B oeis=A225693
0:200.collect { :n |
	n.integerDigits
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-B.svg)

Least _m_ such that the alternating sum of _m_ is _n_,
OEIS [A061479](https://oeis.org/A061479):

~~~spl svg=C oeis=A061479
0:22.collect { :n |
	0:Infinity.detect { :m |
		let d = m.integerDigits;
		d.alternatingSum = n
	}
}.log.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-C.svg)

Alternating sum of reverse of binary expansion of _n_,
OEIS [A065359](https://oeis.org/A065359):

~~~spl svg=D oeis=A065359
0:100.collect { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-D.svg)

Partial sums of alternating sum of reverse of binary expansion of _n_,
OEIS [A005536](https://oeis.org/A005536):

~~~spl svg=E oeis=A005536
0:1023.collect { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum
}.prefixSum.linePlot
~~~

![](sw/spl/Help/Image/alternatingSum-E.svg)

Absolute first differences of alternating sum of reverse of binary expansion of _n_,
OEIS [A056832](https://oeis.org/A056832):

~~~spl svg=F oeis=A056832 set=1,2
0:65.collect { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum
}.differences.abs.stepPlot
~~~

![](sw/spl/Help/Image/alternatingSum-F.svg)

Select _n_ where alternating sum of reverse of binary expansion is zero,
OEIS [A039004](https://oeis.org/A039004):

~~~spl svg=G oeis=A039004
0:200.select { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum = 0
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-G.svg)

Alternating sum of reverse of ternary expansion of _n_,
OEIS [A065368](https://oeis.org/A065368):

~~~spl svg=H oeis=A065368
0:65.collect { :n |
	n.integerDigits(3)
	.reverse
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-H.svg)

Alternating sum of reverse of binary expansion of the _n_-th prime,
OEIS [A065081](https://oeis.org/A065081):

~~~spl svg=I oeis=A065081
1:85.prime.collect { :n |
	n.integerDigits(2)
	.reverse
	.alternatingSum
}.discretePlot
~~~

![](sw/spl/Help/Image/alternatingSum-I.svg)

* * *

See also: sum

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/AlternatingSeries.html),
_W_
[1](https://en.wikipedia.org/wiki/Alternating_series)
