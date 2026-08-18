# lcm

- _lcm(c)_
- _lcm(m, n)_

Least common multiple,
either of the collection _c_,
or of the two number _m_ and _n_.
The least common multiple of two numbers is their `product` divided by the `gcd`.

```
>>> 0.lcm(9)
0

>>> 4.lcm(6)
12

>>> 1.lcm(1)
1

>>> 1624.lcm(26)
21112
```

At `Collection`:

```
>>> [2 3 5].reduce(lcm:/2)
30

>>> [2 3 5].lcm
30

>>> [3 -5 7].lcm
105

>>> [1/3 2/5 3/7].lcm
6

>>> [5].lcm
5

>>> 1:20.lcm
232792560
```

Lcm threads elementwise over lists:

```
>>> [3 7 40].collect { :each |
>>> 	12.lcm(each)
>>> }
[12 84 120]

>>> [3 7 40].lcm(12)
[12 84 120]

>>> 12.lcm([3 7 40])
[12 84 120]
```

Table for small _n_:

```
>>> lcm:/2.table(2:4, 1:10)
[
	2  2  6  4 10  6 14  8 18 10;
	3  6  3 12 15  6 21 24  9 30;
	4  4 12  4 20 12 28  8 36 20
]
```

`lcm` table for _0:10_,
OEIS [A109042](https://oeis.org/A109042) when read by antidiagonals:

```
>>> lcm:/2.table(0:10, 0:10)
[
	0  0  0  0  0  0  0  0  0  0  0;
	0  1  2  3  4  5  6  7  8  9 10;
	0  2  2  6  4 10  6 14  8 18 10;
	0  3  6  3 12 15  6 21 24  9 30;
	0  4  4 12  4 20 12 28  8 36 20;
	0  5 10 15 20  5 30 35 40 45 10;
	0  6  6  6 12 30  6 42 24 18 30;
	0  7 14 21 28 35 42  7 56 63 70;
	0  8  8 24  8 40 24 56  8 72 40;
	0  9 18  9 36 45 18 63 72  9 90;
	0 10 10 30 20 10 30 70 40 90 10
]
```

Lcm of first one hundred integers:

```
>>> (1L .. 100L).lcm
69720375229712477164533808935312303556800L
```

Cumulative least common multiples:

```
>>> 1:9.scan(lcm:/2)
[1 2 6 12 60 60 420 840 2520]
```

Signs are discarded:

```
>>> [-3 7].lcm
21
```

For `zero` and `one`, `lcm` is analogous to logical and:

```
>>> lcm:/2.table([0 1], [0 1])
[0 0; 0 1]

>>> &&.table([false true], [false true])
[false false; false true]
```

Alternately _n_ and _2n_,
[A109043](https://oeis.org/A109043):

```
>>> 0:23.lcm(2)
[
	 0  2  2  6  4 10  6 14  8 18
	10 22 12 26 14 30 16 34 18 38
	20 42 22 46
]
```

Least common multiple of _1:n_,
OEIS [A003418](https://oeis.org/A003418),
or
OEIS [A051451](https://oeis.org/A051451) if duplicate terms are removed:

```
>>> 1:11.collect { :n |
>>> 	1:n.lcm
>>> }
[1 2 6 12 60 60 420 840 2520 2520 27720]
```

The sum of `mangoldtLambda` of the first n integers is equal to the natural log of the `lcm` of the first n integers:

```
>>> 1:10.sum(mangoldtLambda:/1)
2520.log

>>> 1:10.lcm.log
2520.log
```
Maximal order of group elements from the symmetric group of order n (Landau’s function):

```
>>> 1:20.collect { :n |
>>> 	n.integerPartitions
>>> 	.collect(lcm:/1)
>>> 	.max
>>> }
[
	 1  2  3  4   6   6  12  15  20  30
	30 60 60 84 105 140 210 210 420 420
]
```

`lcm` of binomial coefficients,
OEIS [A002944](https://oeis.org/A002944):

```
>>> 0:12.collect { :n |
>>> 	n.binomial(0:n).lcm
>>> }
[
	1 1 2 3 12 10 60 105 280 252
	2520 2310 27720
]

>>> 1:13.collect { :n | 1:n.lcm / n }
[
	1 1 2 3 12 10 60 105 280 252
	2520 2310 27720
]
```

Plot the least common multiple for a number with 12:

~~~spl svg=A
1:72.functionPlot { :x |
	x.lcm(12)
}
~~~

![](Help/Image/lcm-A.svg)

Visualize the least common multiples of two integers:

~~~spl png=B
lcm:/2.table(1:100, 1:100)
.negate.rescale.Greymap
~~~

![](Help/Image/lcm-B.png)

Fibonacci numbers:

~~~spl png=C
let f = 1:100.fibonacciNumber;
let m = f[30];
{ :i :j |
	let a = f[i];
	let b = f[j];
	lcm(a, b) % m
}.table(1:75, 1:75).rescale.Greymap
~~~

![](Help/Image/lcm-C.png)

Form the least common multiples of `one` with rational numbers:

~~~spl svg=D
(1 .. 20).collect { :j |
	(1 .. 2 * j).collect { :i |
		Fraction(i, j)
	}
}.catenate.nub.sort.collect { :n |
	lcm(1, n)
}.scatterPlot
~~~

![](Help/Image/lcm-D.svg)

Matrix plot of the least common multiples of two integers:

~~~spl svg=D
lcm:/2.table(1:20, 1:20).matrixPlot
~~~

![](Help/Image/lcm-E.svg)

Plot the logarithm of the cumulative least common multiples:

~~~spl svg=F
2L:100L.scan(lcm:/2).log.scatterPlot
~~~

![](Help/Image/lcm-F.svg)

The least common multiple matrix read by antidiagonals,
from `one`,
OEIS [A351962](https://oeis.org/A351962):

~~~spl svg=G oeis=A351962
1:14.triangularArray { :x :y |
	lcm(x - y + 1, y) - 1
}.++.scatterPlot
~~~

![](Help/Image/lcm-G.svg)

`lcm` triangle,
read by rows,
OEIS [A051173](https://oeis.org/A051173)

~~~spl svg=H oeis=A051173
1:21.triangularArray(lcm:/2)
.++.scatterPlot
~~~

![](Help/Image/lcm-H.svg)

`lcm` antidiagonal array,
from `zero`,
OEIS [A109042](https://oeis.org/A109042):

~~~spl svg=I oeis=A109042
0:17.antidiagonalArray(lcm:/2)
.++.scatterPlot
~~~

![](Help/Image/lcm-I.svg)

`lcm` antidiagonal array,
from `one`,
OEIS [A003990](https://oeis.org/A003990):

~~~spl png=J oeis=A003990
1:60.antidiagonalArray(lcm:/2)
.++.denseScatterPlot
~~~

![](Help/Image/lcm-J.png)

* * *

See also: &&, extendedGcd, gcd, Gcd, Lcm

Guides: Integer Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/LCM),
_Haskell_
[1](https://hackage.haskell.org/package/base/docs/Prelude.html#v:lcm),
_Mathematica_
[1](https://mathworld.wolfram.com/LeastCommonMultiple.html)
[2](https://reference.wolfram.com/language/ref/LCM.html),
_Smalltalk_
5.6.5.14,
_W_
[1](https://en.wikipedia.org/wiki/Least_common_multiple)
