# sum

- _sum(c)_
- _sum(c, f:/1)_

Answer the sum of all the elements in the collection _c_.

```
>>> [1 2 3 5 7 9].sum
27

>>> [1.pi 1 4 1.e 7 8].sum
25.8599

>>> (1:10 ^ 2).sum
385
```

At `RelativeRange` and `Range`,
the `sum` is calculated directly using a closed form:

```
>>> 1:9.sum
45

>>> 9 * (9 + 1) / 2
45

>>> 1:9.reduce(+)
45

>>> (3, 5 .. 27).sum
195

>>> let k = 27 - 3 / 2 + 1;
>>> k * ((k - 1) * 2 + (3 * 2)) / 2
195

>>> (2 .. 1000).sum
500499

>>> (23L, 37L .. 26781361428314L).sum
25615761426939509660643648L

>>> (1, 1.01 .. 5).sum
1198
```

Row-wise sums of a matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9]
>>> .collect(sum:/1)
[6 15 24]

>>> [1 2 3; 4 5 6; 7 8 9]
>>> .transpose
>>> .sum
[6 15 24]
```

Column-wise sums of a matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9].sum
[12 15 18]

>>> [1 2 3; 4 5 6; 7 8 9]
>>> .transpose
>>> .collect(sum:/1)
[12 15 18]
```

Total sum of a matrix:

```
>>> [1 2 3; 4 5 6; 7 8 9].sum.sum
45
```

Sum is implemented efficiently for `IdentityMultiset` as a sum of products:

```
>>> [3 3 3 5 5 5 5 5].asIdentityMultiset.sum
(3 * 3) + (5 * 5)
```

The sum of an empty collection is `zero`:

```
>>> [].sum
0
```

Difference between a sum squared, and the sum of squares:

```
>>> let x = 1:100;
>>> (x.sum ^ 2) - (x ^ 2).sum
25502500 - 338350
```

The binary form applies the block _f_ to each element before summing:

```
>>> 1:10.sum(square:/1)
385
```

An instance of a family of cutoff, or weighting, functions that answer _-1/12_ for a partial sum of the integers:

```
>>> let n = 5;
>>> (1 .. 99).sum { :x |
>>> 	x * (x / n).-.exp * (x / n).cos
>>> }
-1/12
```

Number of trees with _n_ unlabeled nodes,
OEIS [A000055](https://oeis.org/A000055)

```
>>> let b:/1 = { :n |
>>> 	(n < 2).if {
>>> 		n
>>> 	} {
>>> 		let m = n - 1;
>>> 		1:m.sum { :j |
>>> 			j.divisors.sum { :d |
>>> 				d * b(d) * b(n - j)
>>> 			}
>>> 		} / m
>>> 	}
>>> }.memoize(true);
>>> let a:/1 = { :n |
>>> 	(n = 1).if {
>>> 		1
>>> 	} {
>>> 		let c = 0:n.sum { :k |
>>> 			b(k) * b(n - k)
>>> 		} - (n % 2 = 0).if {
>>> 			b(n / 2)
>>> 		} {
>>> 			0
>>> 		};
>>> 		b(n) - (c / 2)
>>> 	}
>>> }.memoize(true);
>>> 1:20.collect(a:/1)
[
	1 1 1 2 3
	6 11 23 47 106
	235 551 1301 3159 7741
	19320 48629 123867 317955 823065
]
```

Number of ways to cover an _n_-set,
OEIS [A003465](https://oeis.org/A003465):

```
>>> 0L:6.collect { :n |
>>> 	0:n.sum { :j |
>>> 		let a = binomial(n, j);
>>> 		let b = 2 ^ (2 ^ (n - j) - 1);
>>> 		(-1 ^ j) * a * b
>>> 	}
>>> }
[
	1
	1
	5
	109
	32297
	2147321017
	9223372023970362989L
]
```

Molien series for three-dimensional group _[2,n]=*22n_,
OEIS [A008728](https://oeis.org/A008728):

```
>>> 0:39.collect { :n |
>>> 	let m = n + 10;
>>> 	0:m.sum { :j |
>>> 		(j / 10).floor
>>> 	}
>>> }
[
	 1  2  3  4  5  6  7  8  9  10
	12 14 16 18 20 22 24 26 28  30
	33 36 39 42 45 48 51 54 57  60
	64 68 72 76 80 84 88 92 96 100
]

>>> [2 -1 0 0 0 0 0 0 0 1 -2 1]
>>> .linearRecurrence(
>>> 	[1 2 3 4 5 6 7 8 9 10 12 14], 40
>>> )
[
	 1  2  3  4  5  6  7  8  9  10
	12 14 16 18 20 22 24 26 28  30
	33 36 39 42 45 48 51 54 57  60
	64 68 72 76 80 84 88 92 96 100
]
```

Evaluate symbolically:

```
>> [`x` `y` `z`].sum
(+ (+ x y) z)
```

Sum previous terms at offset divisors,
OEIS [A281488](https://oeis.org/A281488):

~~~spl svg=A oeis=A281488
let a = [1];
2:200.do { :n |
	let m = n - 1;
	a.add(
		m.select { :d |
			(n - 2) % d = 0
		}.sum { :d |
			a[d]
		}.negate
	)
};
a

.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/sum-A.svg)

Recursive two-parameter sequence allowing Ramanujan’s sum calculation,
OEIS [A282634](https://oeis.org/A282634):

~~~spl svg=B oeis=A282634
let b:/2 = { :n :m |
	(n = 1).if {
		(m = 0).boole
	} {
		(n > 1).if {
			b(n - 1, m)
			-
			b(n - 1, m - n + 1)
		} {
			0
		}
	}
}.memoize(true);
(1 .. 17).collect { :n |
	(0 .. n - 1).collect { :m |
		let o = (n - 1) / 2 - (m / n);
		(0 .. o.round).sum { :i |
			b(n, i * n + m)
		}
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/sum-B.svg)

Count number of partitions combining with _inclusive or_,
OEIS [A054244](https://oeis.org/A054244):

~~~spl svg=C oeis=A054244
let f = { :n |
	0:n.sum { :k |
		let a = binomial(n, k);
		let b = 2 ^ (2 ^ (n - k));
		(-1 ^ k) * a * b
	} / 2
};
1:200.collect { :n |
	f(n.digitCount(2, 1))
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/sum-C.svg)

Euler transform of _-3,-3,-2_,
OEIS [A005928](https://oeis.org/A005928):

~~~spl svg=D oeis=A005928 signed
let u = [1 -1 -3 1 -1 3 1 -1 0];
0:150.collect { :n |
	(n < 1).if {
		(n = 0).boole
	} {
		-3 * n.divisors.sum { :d |
			u[d.mod(9, 1)]
		}
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-D.svg)

_b⊛c_ where _b(h)=h_ and _c(h)=h+n-1_,
OEIS [A213500](https://oeis.org/A213500):

~~~spl svg=E oeis=A213500
1:13.antidiagonalArray { :n :k |
	let m = k - 1;
	0:m.sum { :i |
		(k - i) * (n + i)
	}
}.catenate.scatterPlot
~~~

![](sw/spl/Help/Image/sum-E.svg)

_Σi^2*-1^i_ for _n:2n_,
OEIS [A225144](https://oeis.org/A225144):

~~~spl svg=F oeis=A225144
1:65.collect { :n |
	let m = n * 2;
	n:m.sum { :i |
		(i ^ 2) * (-1 ^ i)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-F.svg)

_Σ0:n𝒙|n_,
OEIS [A224915](https://oeis.org/A224915):

~~~spl svg=G oeis=A224915
0:63.collect { :n |
	0:n.sum { :i |
		n.bitXor(i)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-G.svg)

_Σ0:n|n_,
OEIS [A350093](https://oeis.org/A350093):

~~~spl svg=H oeis=A350093
0:63.collect { :n |
	0:n.sum { :i |
		n.bitOr(i)
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-H.svg)

A variant of the inventory sequence,
OEIS [A347738](https://oeis.org/A347738):

~~~spl svg=I oeis=A347738
let b = [1: 0];
let a = Map { :n |
	(n = 1).if {
		0
	} {
		let m = n - 1;
		let t = (a[n - 1] = 0).if {
			0
		} {
			b[n - 1] + 1
		};
		b[n] := t;
		1:m.sum { :j |
			(a[j] >= t).boole
		}
	}
};
a[1:150].scatterPlot
~~~

![](sw/spl/Help/Image/sum-I.svg)

A symmetric square array,
read by antidiagonals,
given by a summing recurrence,
OEIS [A191898](https://oeis.org/A191898):

~~~spl svg=J oeis=A191898
let t = { :n :k |
	[
		{ n < 1 | { k < 1 } } -> { 0 },
		{ n = 1 | { k = 1 } } -> { 1 },
		{ k > n } -> { t(k, n) },
		{ n > k } -> {
			let m = n.mod(k, 1);
			t(k, m)
		},
		{ true } -> {
			0 - (1 .. n - 1).sum { :i |
				t(n, i)
			}
		}
	].which
};
1:17.antidiagonalArray(t:/2)
.catenate.discretePlot
~~~

![](sw/spl/Help/Image/sum-J.svg)

Molien series for three-dimensional group _[2,n]=*22n_,
OEIS [A008728](https://oeis.org/A008728):

~~~spl svg=K oeis=A008728
0:65.collect { :n |
	let m = n + 10;
	0:m.sum { :j |
		(j / 10).floor
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/sum-K.svg)

Where supported `sum` is displayed as Σ.

* * *

See also: +, accumulate, alternatingSum, injectInto, neumaierSum, pairwiseSum, prefixSum, product, reduce

Guides: Collection Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/Total.html),
[2](https://mathworld.wolfram.com/Sum.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/sum.html),
_Python_
[1](https://docs.python.org/3/library/functions.html#sum)

Unicode: U+03A3 Σ Greek Capital Letter Sigma

Categories: Math, Operator
