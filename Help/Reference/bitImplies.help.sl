# bitImplies

- _bitImplies(p, q)_

Answer the bitwise logical implication _p→q_.

Specific values:

```
>>> 4.bitImplies(10)
11

>>> 6.bitImplies(12)
13

>>> 25.bitImplies(97)
103
```

Bitwise logical implies triangular array,
_k→n_,
OEIS [A265705](https://oeis.org/A265705):

```
>>> 0:8.triangularArray(
>>> 	bitImplies:/2.swap
>>> )
[
	0;
	1 1;
	3 2 3;
	3 3 3 3;
	7 6 5 4 7;
	7 7 5 5 7 7;
	7 6 7 6 7 6 7;
	7 7 7 7 7 7 7 7;
	15 14 13 12 11 10 9 8 15
]
```

Bitwise logical implication _n→2n_,
OEIS [A265705](https://oeis.org/A265705):

```
>>> 0:14.collect { :n |
>>> 	n.bitImplies(2 * n)
>>> }
[0 2 5 6 11 10 13 14 23 22 21 22 27 26 29]
```

Bitwise logical implication _n→P(n)_,
OEIS [A265885](https://oeis.org/A265885):

```
>>> 1:14.collect { :n |
>>> 	n.bitImplies(n.prime)
>>> }
[2 3 5 7 11 13 25 23 23 29 31 55 59 59]
```

Bitwise logical implies triangular array,
_k→n_,
OEIS [A265705](https://oeis.org/A265705):

~~~spl svg=A oeis=A265705
0:19.triangularArray(bitImplies:/2.swap)
.catenate.scatterPlot
~~~

![](Help/Image/bitImplies-A.svg)

Bitwise logical implication _n→2n_,
OEIS [A265716](https://oeis.org/A265716):

~~~spl svg=B oeis=A265716
0:85.collect { :n |
	n.bitImplies(2 * n)
}.discretePlot
~~~

![](Help/Image/bitImplies-B.svg)

Bitwise logical implication _n→2n_,
scatter plot,
OEIS [A265716](https://oeis.org/A265716):

~~~spl svg=C oeis=A265716
0:127.collect { :n |
	n.bitImplies(2 * n)
}.scatterPlot
~~~

![](Help/Image/bitImplies-C.svg)

Bitwise logical implication _n→P(n)_,
OEIS [A265885](https://oeis.org/A265885):

~~~spl svg=D oeis=A265885
1:85.collect { :n |
	n.bitImplies(n.prime)
}.discretePlot
~~~

![](Help/Image/bitImplies-D.svg)

Bitwise logical implication _n→P(n)_,
scatter plot,
OEIS [A265885](https://oeis.org/A265885):

~~~spl svg=E oeis=A265885
1:127.collect { :n |
	n.bitImplies(n.prime)
}.scatterPlot
~~~

![](Help/Image/bitImplies-E.svg)

* * *

See also: bitLength, bitNot, bitOr, implies

Guides: Bitwise Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Implies.html)
