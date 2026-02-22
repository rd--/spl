# multiplicativeSuborder

- _multiplicativeSuborder(a, n)_

Answer the multiplicative suborder of _a_ modulo _n_.

Multiplicative suborder of three,
OEIS [A103489](https://oeis.org/A103489):

```
>>> 0:89.collect { :n |
>>> 	3.multiplicativeSuborder(n)
>>> }
[
	0 0 1 0 1 2 0 3 2 0 2 5 0 3 3 0 4 8 0 9
	4 0 5 11 0 10 3 0 3 14 0 15 8 0 8 12 0
	9 9 0 4 4 0 21 10 0 11 23 0 21 10 0 6
	26 0 20 6 0 14 29 0 5 15 0 16 12 0 11
	16 0 12 35 0 6 9 0 9 30 0 39 4 0 4 41
	0 16 21 0 10 44
]
```

Multiplicative suborder of five,
OEIS [A103491](https://oeis.org/A103491):

```
>>> 0:90.collect { :n |
>>> 	5.multiplicativeSuborder(n)
>>> }
[
	0 0 1 1 1 0 1 3 2 3 0 5 2 2 3 0 4 8 3 9
	0 3 5 11 2 0 2 9 6 7 0 3 8 10 8 0 6 18
	9 4 0 10 3 21 5 0 11 23 4 21 0 16 4
	26 9 0 6 18 7 29 0 15 3 3 16 0 10 11
	16 11 0 5 6 36 18 0 9 30 4 39 0 27 10
	41 6 0 21 7 10 22 0
]
```

Multiplicative suborder of two modulo _2n+1_,
OEIS [A003558](https://oeis.org/A003558):

```
>>> 1:70.collect { :n |
>>> 	let m = 2 * n + 1;
>>> 	2.multiplicativeSuborder(m)
>>> }
[
	1 2 3 3 5 6 4 4 9 6 11 10 9 14 5 5 12
	18 12 10 7 12 23 21 8 26 20 9 29 30
	6 6 33 22 35 9 20 30 39 27 41 8 28 11
	12 10 36 24 15 50 51 12 53 18 36 14
	44 12 24 55 20 50 7 7 65 18 36 34 69
	46
]
```

Multiplicative suborder of three,
OEIS [A103489](https://oeis.org/A103489):

~~~spl svg=A
0:200.collect { :n |
	3.multiplicativeSuborder(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeSuborder-A.svg)

Multiplicative suborder of five,
OEIS [A103491](https://oeis.org/A103491):

~~~spl svg=B
0:200.collect { :n |
	5.multiplicativeSuborder(n)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeSuborder-B.svg)

Multiplicative suborder of two modulo _2n+1_,
OEIS [A003558](https://oeis.org/A003558):

~~~spl svg=C
1:200.collect { :n |
	2.multiplicativeSuborder(2 * n + 1)
}.scatterPlot
~~~

![](sw/spl/Help/Image/multiplicativeSuborder-C.svg)

* * *

See also: gcd, mod, multiplicativeOrder

Guides: Mathematical Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SuborderFunction.html)
