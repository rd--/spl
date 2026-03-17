# primitiveRootList

- _primitiveRootList(n)_

Answer a list of primitive roots of _n_.

Lists of primitive roots:

```
>>> 9.primitiveRootList
[2 5]

>>> 14.primitiveRootList
[3 5]
```

Table of first few primitive roots
OEIS [A046147](https://oeis.org/A046147):

```
>>> 2:31.collect(primitiveRootList:/1)
[
	1;
	2;
	3;
	2 3;
	5;
	3 5;
	;
	2 5;
	3 7;
	2 6 7 8;
	;
	2 6 7 11;
	3 5;
	;
	;
	3 5 6 7 10 11 12 14;
	5 11;
	2 3 10 13 14 15;
	;
	;
	7 13 17 19;
	5 7 10 11 14 15 17 19 20 21;
	;
	2 3 8 12 13 17 22 23;
	7 11 15 19;
	2 5 11 14 20 23;
	;
	2 3 8 10 11 14 15 18 19 21 26 27;
	;
	3 11 12 13 17 21 22 24
]
```

If n has a primitive root, then it has exactly _phi(phi(n))_ of them:

```
>>> 2:31.collect(primitiveRootList:/1)
>>> .collect(size:/1)
[
	1  1  1  2  1  2  0  2  2  4
	0  4  2  0  0  8  2  6  0  0
	4 10  0  8  4  6  0 12  0  8
]

>>> 2:31.collect { :n |
>>> 	n.eulerPhi.eulerPhi
>>> }
[
	1  1  1  2  1  2  2  2  2  4
	2  4  2  4  4  8  2  6  4  4
	4 10  4  8  4  6  4 12  4  8
]
```

Select reptend primes,
a prime with a specified primitive root,
in this case ten,
called a full reptend prime,
OEIS [A001913](https://oeis.org/A001913):

```
>>> 1:35.prime.select { :x |
>>> 	x.primitiveRootList.includes(10)
>>> }
[
	 17  19  23  29  47
	 59  61  97 109 113
	131 149
]
```

Primes with primitive root two,
OEIS [A001122](https://oeis.org/A001122):

```
>>> 1:35.prime.select { :x |
>>> 	x.primitiveRootList.includes(2)
>>> }
[
	  3   5  11  13  19
	 29  37  53  59  61
	 67  83 101 107 131
	139 149
]
```

Numbers that have a primitive root,
OEIS [A033948](https://oeis.org/A033948):

```
>>> 2:100.reject { :x |
>>> 	x.primitiveRootList.isEmpty
>>> }
[
	 2  3  4  5  6  7  9 10 11 13
	14 17 18 19 22 23 25 26 27 29
	31 34 37 38 41 43 46 47 49 50
	53 54 58 59 61 62 67 71 73 74
	79 81 82 83 86 89 94 97 98
]
```

Largest positive primitive root of _n_-th prime,
OEIS [A071894](https://oeis.org/A071894):

```
>>> 1:43.collect { :n |
>>> 	n.prime.primitiveRootList.max
>>> }
[
	1 2 3 5 8 11 14 15 21 27 24 35 35 34
	45 51 56 59 63 69 68 77 80 86 92 99
	101 104 103 110 118 128 134 135 147
	146 152 159 165 171 176 179 189
]
```

Least positive primitive root of _n_-th prime,
OEIS [A001918](https://oeis.org/A001918):

```
>>> 1:43.collect { :n |
>>> 	n.prime.primitiveRootList.min
>>> }
[
	1 2 2 3 2 2 3 2 5 2 3 2 6 3 5 2 2 2 2
	7 5 3 2 3 5 2 5 2 6 3 3 2 3 2 2 6 5 2
	5 2 2 2 19
]
```

Primitive roots of _n_
OEIS [A046147](https://oeis.org/A046147):

~~~spl svg=A oeis=A046147
2:43.collect(primitiveRootList:/1)
.catenate.scatterPlot
~~~

![](Help/Image/primitiveRootList-A.svg)

Sums of primitive roots of _n_
OEIS [A121380](https://oeis.org/A121380):

~~~spl svg=B oeis=A121380
1:65.collect { :n |
	n.primitiveRootList.sum
}.discretePlot
~~~

![](Help/Image/primitiveRootList-B.svg)

Least primitive root of _n_-th prime,
OEIS [A001918](https://oeis.org/A001918):

~~~spl svg=C oeis=A001918
1:66.collect { :n |
	n.prime.primitiveRootList.min
}.stepPlot
~~~

![](Help/Image/primitiveRootList-C.svg)

Sum of primitive roots of _n_-th prime,
OEIS [A088144](https://oeis.org/A088144):

~~~spl svg=D oeis=A088144
1:90.collect { :n |
	n.prime.primitiveRootList.sum
}.scatterPlot
~~~

![](Help/Image/primitiveRootList-D.svg)

_(Σ(R(p(n))) - μ(p(n)-1))/p(n)_,
OEIS [A088145](https://oeis.org/A088145):

~~~spl svg=E oeis=A088145
1:71.collect { :n |
	let p = n.prime;
	let r = p.primitiveRootList.sum;
	(r - (p - 1).moebiusMu) / p
}.discretePlot
~~~

![](Help/Image/primitiveRootList-E.svg)

Triangle in which _n_-th row lists all primitive roots modulo the _n_-th prime,
OEIS [A060749](https://oeis.org/A060749):

~~~spl svg=F oeis=A060749
1:23.collect { :n |
	n.prime.primitiveRootList
}.catenate.scatterPlot
~~~

![](Help/Image/primitiveRootList-F.svg)

Smallest primitive root modulo _n_ or 0 if no root exists,
OEIS [A046145](https://oeis.org/A046145):

~~~spl svg=G oeis=A046145
1:85.collect { :n |
	let r = n.primitiveRootList;
	r.ifEmpty { 0 } { r.min }
}.discretePlot
~~~

![](Help/Image/primitiveRootList-G.svg)

Largest primitive root modulo _n_ or 0 if no root exists,
OEIS [A046146](https://oeis.org/A046146):

~~~spl svg=H oeis=A046146
1:85.collect { :n |
	let r = n.primitiveRootList;
	r.ifEmpty { 0 } { r.max }
}.discretePlot
~~~

![](Help/Image/primitiveRootList-H.svg)

Least positive prime primitive root of _n_-th prime,
OEIS [A002233](https://oeis.org/A002233):

~~~spl svg=I oeis=A002233
2:85.collect { :n |
	n.prime.primitiveRootList
	.detect(isPrime:/1)
}.discretePlot
~~~

![](Help/Image/primitiveRootList-I.svg)

* * *

See also: mangoldtLambda, multiplicativeOrder, welchCostasArrayList

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PrimitiveRoot.html)
[2](https://reference.wolfram.com/language/ref/PrimitiveRootList.html),
_OEIS_
[1](https://oeis.org/A033948)
[2](https://oeis.org/A046144)
[3](https://oeis.org/A001913)
[4](https://oeis.org/A001122)
[5](https://oeis.org/A046147),
_W_
[1](https://en.wikipedia.org/wiki/Primitive_root_modulo_n)
