# binomial

- _binomial(n, k)_

The binomial coefficients are the positive integers that occur as coefficients in the binomial theorem.
Commonly, a binomial coefficient is indexed by a pair of integers _n ≥ k ≥ 0_.
Tells the number of combinations of _n_ elements taken _k_ at a time,
usually pronounced _n choose k_.

With positive integer _n_ and _k_:

```
>>> 4.binomial(2)
6

>>> 6.binomial(3)
20

>>> 8.binomial(4)
70

>>> 8.binomial(5)
56
```

Relation to `factorial`:

```
>>> let n = 8;
>>> let k = 5;
>>> n.! / (k.! * (n - k).!)
56
```

_n_ less than _k_:

```
>>> 3.binomial(5)
0

>>> 5.binomial(23)
0
```

Real valued arguments:

```
>>> 8.5.binomial(-4.2)
0.0000604992

>>> 2.binomial(0.5)
(16 / 3.pi)
```

_k_ may be a collection:

```
>>> [10 1 2 5].collect { :each |
>>> 	10.binomial(each)
>>> }
[1 10 45 252]

>>> 10.binomial([10 1 2 5])
[1 10 45 252]
```

Evaluate for half-integer arguments:

```
>>> (9 / 2).binomial(7 / 2)
(9 / 2)
```

Make Pascal’s triangle (this function is zero outside of Pascal’s triangle):

```
>>> 0:5.collect { :each |
>>> 	each.binomial(0:each)
>>> }
[
	1;
	1 1;
	1 2 1;
	1 3 3 1;
	1 4 6 4 1;
	1 5 10 10 5 1
]
```

At `zero`:

```
>>> 0.binomial(0)
1

>>> 0.binomial(1)
0

>>> 1.binomial(0)
1
```

At `LargeInteger`:

```
>>> 333L.binomial(33L)
3888653852803216535842634400242612716809201918L
```

If _k_ is greater than _n_ the answer is zero:

```
>>> 3.binomial(6)
0
```

Threads over lists:

```
>>> 5.binomial([3 4 5])
[10 5 1]

>>> 11:13.binomial(1:3)
[11 66 286]

>>> [
>>> 	11.binomial(1),
>>> 	12.binomial(2),
>>> 	13.binomial(3)
>>> ]
[11 66 286]
```

One of a family of integer sequences (OEIS A006542):

```
>>> 4:37.collect { :n |
>>> 	let a = binomial(n, 3);
>>> 	let b = binomial(n - 1, 3);
>>> 	a * (b / 4)
>>> }
[
	1 10 50 175
	490 1176 2520 4950
	9075 15730 26026 41405
	63700 95200 138720 197676
	276165 379050 512050 681835
	896126 1163800 1495000 1901250
	2395575 2992626 3708810 4562425
	5573800 6765440 8162176 9791320
	11682825 13869450
]
```

Calculate the triangle of trinomial coefficients,
OEIS [A027907](https://oeis.org/A027907):

```
>>> (0 .. 6).collect { :n |
>>> 	(0 .. 2 * n).collect { :k |
>>> 		(0 .. n).sum { :i |
>>> 			binomial(n, i)
>>> 			*
>>> 			binomial(n - i, k - (2 * i))
>>> 		}
>>> 	}
>>> }
[
	1;
	1 1 1;
	1 2 3 2 1;
	1 3 6 7 6 3 1;
	1 4 10 16 19 16 10 4 1;
	1 5 15 30 45 51 45 30 15 5 1;
	1 6 21 50 90 126 141 126 90 50 21 6 1
]
```

The sum of binomial coefficients _(n-i,i)_ for _i_ in _(0,n/2)_ is the _n+1_-th Fibonacci number:

```
>>> let n = 23;
>>> (0 .. n // 2).sum { :i |
>>> 	binomial(n - i, i)
>>> }
(n + 1).fibonacci
```

Regions obtained by joining _n_ points around a circle by straight lines,
OEIS [A000127](https://oeis.org/A000127):

```
>>> 1:25.collect { :n |
>>> 	[0 2 4].sum { :i |
>>> 		binomial(n, i)
>>> 	}
>>> }
[
	     1      2      4      8    16
	    31     57     99    163   256
	   386    562    794   1093  1471
	  1941   2517   3214   4048  5036
	  6196   7547   9109  10903 12951
]
```

Plot over a subset of the reals as a function of its first parameter:

~~~spl svg=A
(-1.975 -- 4).functionPlot { :x |
	x.binomial(3)
}
~~~

![](sw/spl/Help/Image/binomial-A.svg)

Plot over a subset of the reals as a function of its second parameter:

~~~spl svg=B
(-1.975 -- 4).functionPlot { :x |
	3.binomial(x)
}
~~~

![](sw/spl/Help/Image/binomial-B.svg)

* * *

See also: factorial, multinomial, trinomial

Guides: Combinatorial Functions

References:
_Apl_
[1](https://aplwiki.com/wiki/Binomial),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/bang#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/BinomialCoefficient.html)
[2](https://mathworld.wolfram.com/Choose.html)
[3](https://reference.wolfram.com/language/ref/Binomial.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/nchoosek.html),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_coefficient)

Categories: Math, Combinatorics
