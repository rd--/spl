# jordanTotient

- _jordanTotient(k, n)_

Answer Jordan’s totient function,
denoted as _Jₖ(n)_,
a generalization of Euler’s totient function.

Where _k=1_ equal to `eulerPhi`:

```
>>> 1.jordanTotient(8)
4

>>> 8.eulerPhi
4

>>> 2.jordanTotient(8)
48
```

_Jₖ_ is multiplicative,
_Jₖ(i×j)_ equals _Jₖ(i)×Jₖ(j)_:

```
>>> 2.jordanTotient([8 9]).product
3456

>>> 2.jordanTotient([8 9].product)
3456
```

Jordan function _k=2_,
OEIS [A007434](https://oeis.org/A007434):

```
>>> 2.jordanTotient(1:48)
[
	1 3 8 12 24 24 48 48 72 72 120 96
	168 144 192 192 288 216 360 288 384
	360 528 384 600 504 648 576 840 576
	960 768 960 864 1152 864 1368 1080
	1344 1152 1680 1152 1848 1440 1728
	1584 2208 1536
]
```

Jordan function _k=3_,
OEIS [A059376](https://oeis.org/A059376):

```
>>> 3.jordanTotient(1:10)
[1 7 26 56 124 182 342 448 702 868]
```

Jordan function _k=4_,
OEIS [A059377](https://oeis.org/A059377):

```
>>> 4.jordanTotient(1:9)
[1 15 80 240 624 1200 2400 3840 6480]
```

Jordan function _k=5_,
OEIS [A059378](https://oeis.org/A059378):

```
>>> 5.jordanTotient(1:8)
[1 31 242 992 3124 7502 16806 31744]
```

Tables for small _k_ and _n_:

```
>>> jordanTotient:/2.table(1:6, 1:7)
[
	1 1 2 2 4 2 6;
	1 3 8 12 24 24 48;
	1 7 26 56 124 182 342;
	1 15 80 240 624 1200 2400;
	1 31 242 992 3124 7502 16806;
	1 63 728 4032 15624 45864 117648
]

>>> jordanTotient:/2.swap.table(1:7, 1:7)
[
	1 1 1 1 1 1 1;
	1 3 7 15 31 63 127;
	2 8 26 80 242 728 2186;
	2 12 56 240 992 4032 16256;
	4 24 124 624 3124 15624 78124;
	2 24 182 1200 7502 45864 277622;
	6 48 342 2400 16806 117648 823542
]
```

Jordan function _n=6_,
OEIS [A059387](https://oeis.org/A059387):

```
>>> 1:10.jordanTotient(6)
[
	2 24 182 1200 7502 45864 277622
	1672800 10057502 60406104
]

>>> [12 -47 72 -36].linearRecurrence(
>>> 	[2 24 182 1200], 10
>>> )
[
	2 24 182 1200 7502 45864 277622
	1672800 10057502 60406104
]
```

_J(2,n)/J(1,n)_ is the Dedekind ψ function,
OEIS [A001615](https://oeis.org/A001615):

```
>>> let n = 1:23;
>>> 2.jordanTotient(n)
>>> /
>>> 1.jordanTotient(n)
[
	 1  3  4  6  6 12  8 12 12 18
	12 24 14 24 24 24 18 36 20 36
	32 36 24
]
```

Jordan function _k=2_,
OEIS [A007434](https://oeis.org/A007434):

~~~spl svg=A oeis=A007434
2.jordanTotient(1:150).scatterPlot
~~~

![](sw/spl/Help/Image/jordanTotient-A.svg)

Jordan function _k=3_,
OEIS [A059376](https://oeis.org/A059376):

~~~spl svg=B oeis=A059376
3.jordanTotient(1:100).scatterPlot
~~~

![](sw/spl/Help/Image/jordanTotient-B.svg)

Array of values of Jordan function _Jₖ(n)_ read by antidiagonals,
OEIS [A059379](https://oeis.org/A059379):

~~~spl svg=C oeis=A059379
1:13.antidiagonalArray(
	jordanTotient:/2
).catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/jordanTotient-C.svg)

_J(3,n)/J(1,n)_,
OEIS [A160889](https://oeis.org/A160889):

~~~spl svg=D oeis=A160889
let n = 1:115;
let a = 3.jordanTotient(n);
let b = 1.jordanTotient(n);
(a / b).scatterPlot
~~~

![](sw/spl/Help/Image/jordanTotient-D.svg)

* * *

See also: dedekindPsi, divisorSum, eulerPhi, moebiusMu

Guides: Integer Functions

References:
_Maple_
[1](https://www.maplesoft.com/support/help/Maple/view.aspx?path=NumberTheory/JordanTotient),
_W_
[1](https://en.wikipedia.org/wiki/Jordan%27s_totient_function)
