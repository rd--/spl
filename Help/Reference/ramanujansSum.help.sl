# ramanujansSum

- _ramanujansSum(q, n)_

Answer Ramanujan’s sum _Cq(n)_.

Table of first few terms,
OEIS [A054535](https://oeis.org/A054535):

```
>>> ramanujansSum:/2.table(1:9, 1:9)
[
	 1  1  1  1  1  1  1  1  1;
	-1  1 -1  1 -1  1 -1  1 -1;
	-1 -1  2 -1 -1  2 -1 -1  2;
	 0 -2  0  2  0 -2  0  2  0;
	-1 -1 -1 -1  4 -1 -1 -1 -1;
	 1 -1 -2 -1  1  2  1 -1 -2;
	-1 -1 -1 -1 -1 -1  6 -1 -1;
	 0  0  0 -4  0  0  0  4  0;
	 0  0 -3  0  0 -3  0  0  6
]
```

Sum of the _n_-th powers of the _k_-th primitive roots of unity,
OEIS [A054532](https://oeis.org/A054532):

~~~spl svg=A oeis=A054532
1:15.triangularArray(
	ramanujansSum:/2
).catenate.discretePlot
~~~

![](sw/spl/Help/Image/ramanujansSum-A.svg)

Triangular array giving Ramanujan’s sum,
OEIS [A054533](https://oeis.org/A054533):

~~~spl svg=B oeis=A054533
1:15.triangularArray(
	ramanujansSum:/2.swap
).catenate.discretePlot
~~~

![](sw/spl/Help/Image/ramanujansSum-B.svg)

Ramanujan’s sum read by falling antidiagonals,
OEIS [A054534](https://oeis.org/A054534):

~~~spl svg=C oeis=A054534
15.antidiagonalArray(
	ramanujansSum:/2
).catenate.discretePlot
~~~

![](sw/spl/Help/Image/ramanujansSum-C.svg)

Ramanujan’s sum read by rising antidiagonals,
OEIS [A054535](https://oeis.org/A054535):

~~~spl svg=D oeis=A054535
15.antidiagonalArray(
	ramanujansSum:/2
).collect(reverse:/1).catenate.discretePlot
~~~

![](sw/spl/Help/Image/ramanujansSum-D.svg)

* * *

See also: exp, pi

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/RamanujansSum.html),
_W_
[1](https://en.wikipedia.org/wiki/Ramanujan%27s_sum)
