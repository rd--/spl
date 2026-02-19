# shadowTransform

- _shadowTransform([x₁ x₂ …])_

Answer the shadow transform of the integer sequence _x_.

Shadow transform of the squares,
OEIS [A000188](https://oeis.org/A000188):

```
>>> 1:23.square.shadowTransform
[1 1 1 2 1 1 1 2 3 1 1 2 1 1 1 4 1 3 1 2 1 1]
```

Shadow transform of triangular numbers,
OEIS [A068068](https://oeis.org/A068068):

```
>>> 0:22.collect { :n |
>>> 	3.polygonalNumber(n)
>>> }.shadowTransform
[1 1 2 1 2 2 2 1 2 2 2 2 2 2 4 1 2 2 2 2 4 2]
```

The shadow transform of
OEIS [A000522](https://oeis.org/A000522),
OEIS [A072453](https://oeis.org/A072453):

```
>>> let x = { :i :j |
>>> 	i * j + j
>>> }.foldList(0, 1L:104) + 1;
>>> x.shadowTransform
[
	1 1 0 1 2 0 0 1 0 2 0 0 3 0 0 1 0 0 2 2
	0 0 2 0 2 3 0 0 1 0 2 1 0 0 0 0 3 2 0 2
	1 0 1 0 0 2 0 0 0 2 0 3 0 0 0 0 0 1 1 0
	0 2 0 1 6 0 0 0 0 0 2 0 0 3 0 2 0 0 0 2
	0 1 1 0 0 1 0 0 0 0 0 2 0 0 4 0 1 0 0 2
	0 0 1 3
]
```

Plot
OEIS [A072453](https://oeis.org/A072453):

~~~spl svg=A
let x = { :i :j |
	i * j + j
}.foldList(0, 1L:150) + 1;
x.shadowTransform
.discretePlot
~~~

![](sw/spl/Help/Image/shadowTransform-A.svg)

Plot shadow transform of tetrahedral numbers,
OEIS [A072457](https://oeis.org/A072457):

~~~spl svg=B
0:115.tetrahedralNumber
.shadowTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/shadowTransform-B.svg)

Plot shadow transform of _C(n+7,8)_,
OEIS [A144869](https://oeis.org/A144869):

~~~spl svg=C
0:125.collect { :n |
	binomial(n + 7, 8)
}.shadowTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/shadowTransform-C.svg)

Plot shadow transform of _σ(n)_,
OEIS [A072463](https://oeis.org/A072463):

~~~spl svg=D
0:115.collect { :n |
	1.divisorSigma(n)
}.shadowTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/shadowTransform-D.svg)

Plot shadow transform of `fibonacci`,
OEIS [A346080](https://oeis.org/A346080):

~~~spl svg=E
0:115.fibonacci
.shadowTransform
.scatterPlot
~~~

![](sw/spl/Help/Image/shadowTransform-E.svg)

* * *

See also: binomialTransform, boustrophedonTransform, eulerTransform

Guides: Integer Sequence Functions

Further Reading: Halbeisen 1999
