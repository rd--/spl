# dedekindPsi

- _dedekindPsi(n, k=1)_

Answer the Dedekind ψ function for _n_.

The Dedekind ψ function,
threads over lists,
OEIS [A001615](https://oeis.org/A001615):

```
>>> 1:23.dedekindPsi
[
	 1  3  4  6  6 12  8 12 12 18
	12 24 14 24 24 24 18 36 20 36
	32 36 24
]
```

Generalised Dedekind ψ function with _k=2_,
OEIS [A065958](https://oeis.org/A065958):

```
>>> 1:23.dedekindPsi(2)
[
	  1   5  10  20  26
	 50  50  80  90 130
	122 200 170 250 260
	320 290 450 362 520
	500 610 530
]
```

Generalised Dedekind ψ function with _k=3_,
OEIS [A065958](https://oeis.org/A065958):

```
>>> 1:23.dedekindPsi(3)
[
	   1     9    28   72  126
	 252   344   576  756 1134
	1332  2016  2198 3096 3528
	4608  4914  6804 6860 9072
	9632 11988 12168
]
```

Generalised Dedekind ψ function with _k=4_,
OEIS [A065960](https://oeis.org/A065960):

```
>>> 1:9.dedekindPsi(4)
[1 17 82 272 626 1394 2402 4352 6642]
```

The number of integers _m_ in _1:n_ for which _gcd(m,n)_ is not divisible by a square greater than one,
OEIS [A063659](https://oeis.org/A063659):

```
>>> 1:23.dedekindPsi.moebiusTransform
[
	 1  2  3  3  5  6  7  6  8 10
	11  9 13 14 15 12 17 16 19 15
	21 22 23
]
```

Record values of the Dedekind ψ function,
OEIS [A210523](https://oeis.org/A210523):

```
>>> 1:300.dedekindPsi.recordValues
[
	  1   3   4   6  12
	 18  24  36  48  72
	 96 108 144 168 192
	216 240 288 360 384
	432 576 648 672 720
]
```

_gcd(1+n,ψ(n))_,
OEIS [A342915](https://oeis.org/A342915):

```
>>> 1:23.collect { :n |
>>> 	(1 + n).gcd(n.dedekindPsi)
>>> }
[
	 1 3  4 1 6 1  8 3  2 1
	12 1 14 3 8 1 18 1 20 3
	 2 1 24
]
```

The Dedekind ψ function,
OEIS [A001615](https://oeis.org/A001615):

~~~spl svg=A oeis=A001615
1:250.dedekindPsi
.scatterPlot
~~~

![](Help/Image/dedekindPsi-A.svg)

Record values of the Dedekind ψ function,
OEIS [A210523](https://oeis.org/A210523):

~~~spl svg=B oeis=A210523
1:350.dedekindPsi
.recordValues
.scatterPlot
~~~

![](Help/Image/dedekindPsi-B.svg)

_gcd(1+n,ψ(n))_,
OEIS [A342915](https://oeis.org/A342915):

~~~spl svg=C oeis=A342915
1:65.collect { :n |
	(1 + n).gcd(n.dedekindPsi)
}.discretePlot
~~~

![](Help/Image/dedekindPsi-C.svg)

* * *

See also: divisorSum, jordanTotient, moebiusMu, round

Guides: Integer Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/DedekindFunction.html),
_OEIS_
[1](https://oeis.org/wiki/Dedekind_psi_function),
_W_
[1](https://en.wikipedia.org/wiki/Dedekind_psi_function)

Unicode: U+03C8 ψ Greek Small Letter Psi
