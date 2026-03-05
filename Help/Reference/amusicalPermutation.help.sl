# amusicalPermutation

- _amusicalPermutation(n)_

The map
_a(2n)=3n_,
_a(4n+1)=3n+1_,
_a(4n-1)=3n-1_.

First few terms of the amusical permutation,
OEIS [A006368](https://oeis.org/A006368):

```
>>> 0:15.collect(amusicalPermutation:/1)
[0 1 3 2 6 4 9 5 12 7 15 8 18 10 21 11]
```

Iterate the amusical permutation map starting for some periodic _n_,
OEIS [A180853](https://oeis.org/A180853) _n=4_,
OEIS [A217218](https://oeis.org/A217218) _n=44_:

```
>>> amusicalPermutation:/1
>>> .nestList(4, 5)
[4 6 9 7 5 4]

>>> amusicalPermutation:/1
>>> .nestList(44, 12)
[44 66 99 74 111 83 62 93 70 105 79 59 44]
```

Initial segment of table of iterations,
OEIS [A368179](https://oeis.org/A368179):

```
>>> 0:9.collect { :n |
>>> 	amusicalPermutation:/1
>>> 	.nestList(n, 9)
>>> }
[
	0  0  0  0  0  0  0  0  0  0;
	1  1  1  1  1  1  1  1  1  1;
	2  3  2  3  2  3  2  3  2  3;
	3  2  3  2  3  2  3  2  3  2;
	4  6  9  7  5  4  6  9  7  5;
	5  4  6  9  7  5  4  6  9  7;
	6  9  7  5  4  6  9  7  5  4;
	7  5  4  6  9  7  5  4  6  9;
	8 12 18 27 20 30 45 34 51 38;
	9  7  5  4  6  9  7  5  4  6
]
```

First few terms of the amusical permutation,
OEIS [A006368](https://oeis.org/A006368):

~~~spl svg=A
0:65.collect(
	amusicalPermutation:/1
).discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-A.svg)

The smallest number in the trajectory of the amusical permutation map,
OEIS [A028397](https://oeis.org/A028397):

~~~spl svg=B
0:150.collect { :n |
	amusicalPermutation:/1
	.nestList(n, 100).min
}.scatterPlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-B.svg)

Iterate the amusical permutation map starting at eight,
OEIS [A028393](https://oeis.org/A028393):

~~~spl svg=C
amusicalPermutation:/1
.nestList(8, 65)
.discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-C.svg)

Log scale scatter plot of the amusical permutation map starting at eight,
OEIS [A028393](https://oeis.org/A028393):

~~~spl svg=D
amusicalPermutation:/1
.nestList(8, 250)
.log
.linePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-D.svg)

Iterate the amusical permutation map starting at fourteen,
OEIS [A028395](https://oeis.org/A028395):

~~~spl svg=E
amusicalPermutation:/1
.nestList(14, 250)
.log
.linePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-E.svg)

Iterate the amusical permutation map starting at fourty,
OEIS [A182205](https://oeis.org/A182205):

~~~spl svg=F
amusicalPermutation:/1
.nestList(40, 250)
.log
.linePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-F.svg)

First few terms of the amusical permutation applied twice,
OEIS [A168221](https://oeis.org/A168221):

~~~spl svg=G
0:65.collect(
	amusicalPermutation:/1
).collect(
	amusicalPermutation:/1
).discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-G.svg)

Dirichlet inverse of the amusical permutation function,
OEIS [A349351](https://oeis.org/A349351):

~~~spl svg=H
1:115.collect(
	amusicalPermutation:/1
	.dirichletInverse
).discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-H.svg)

Sum of the amusical permutation and it’s dirichlet inverse,
OEIS [A349352](https://oeis.org/A349352):

~~~spl svg=I
let f:/1 = amusicalPermutation:/1;
let g:/1 = f:/1.dirichletInverse;
1:115.collect { :n |
	f(n) + g(n)
}.discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-I.svg)

Initial segment of table of iterations,
read by rising antidiagonals.
OEIS [A368179](https://oeis.org/A368179):

~~~spl svg=J
let k = 16;
let a = 0:k.collect { :n |
	amusicalPermutation:/1
	.nestList(n, k)
};
let b = [];
1:k.sum.antidiagonalIndicesDo { :i :j |
	b.add(a[j][i])
};
b.log.discretePlot
~~~

![](sw/spl/Help/Image/amusicalPermutation-J.svg)

* * *

See also: isEven, floor

References:
_OEIS_
[1](https://oeis.org/A006368)

Further Reading: Conway 1972
