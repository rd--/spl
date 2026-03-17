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
9/2
```

Make Pascal’s triangle (this function is zero outside of Pascal’s triangle),
OEIS [A007318](https://oeis.org/A007318):

```
>>> 0:6.collect { :each |
>>> 	each.binomial(0:each)
>>> }
[
	1;
	1 1;
	1 2 1;
	1 3 3 1;
	1 4 6 4 1;
	1 5 10 10 5 1;
	1 6 15 20 15 6 1
]
```

Square array of binomial coefficients,
OEIS [A052553](https://oeis.org/A052553):

```
>>> 0:7.triangularArray { :n :k |
>>> 	(n - k).binomial(k)
>>> }
[
	1;
	1 0;
	1 1  0;
	1 2  0 0;
	1 3  1 0 0;
	1 4  3 0 0 0;
	1 5  6 1 0 0 0;
	1 6 10 4 0 0 0 0
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
>>> 123L.binomial(45L)
8966473191018617158916954970192684L
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

Binomial coefficients _C(10,n)_,
OEIS [A010926](https://oeis.org/A010926):

```
>>> 0:10.collect { :n | 10.binomial(n) }
[1 10 45 120 210 252 210 120 45 10 1]
```

Triangle of binomial coefficients,
multiplied by the Euler up/down numbers,
also called the boustrophedon triangle,
OEIS [A109449](https://oeis.org/A109449):

```
>>> 0:8.triangularArray { :n :k |
>>> 	binomial(n, k)
>>> 	*
>>> 	eulerUpDownNumber(n - k)
>>> }
[
	1;
	1 1;
	1 2 1;
	2 3 3 1;
	5 8 6 4 1;
	16 25 20 10 5 1;
	61 96 75 40 15 6 1;
	272 427 336 175 70 21 7 1;
	1385 2176 1708 896 350 112 28 8 1
]
```

Calculate the triangle of trinomial coefficients,
OEIS [A027907](https://oeis.org/A027907):

```
>>> [0 .. 6].collect { :n |
>>> 	[0 .. 2 * n].collect { :k |
>>> 		[0 .. n].sum { :i |
>>> 			binomial(n, i)
>>> 			*
>>> 			binomial(
>>> 				n - i,
>>> 				k - (2 * i)
>>> 			)
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
>>> [0 .. n // 2].sum { :i |
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

The first few central binomial coefficients,
OEIS [A000984](https://oeis.org/A000984):

```
>>> 0:27.collect { :n |
>>> 	binomial(2 * n, n)
>>> }
[
	1
	2
	6
	20
	70
	252
	924
	3432
	12870
	48620
	184756
	705432
	2704156
	10400600
	40116600
	155117520
	601080390
	2333606220
	9075135300
	35345263800
	137846528820
	538257874440
	2104098963720
	8233430727600
	32247603683100
	126410606437752
	495918532948104
	1946939425648112
]
```

The cake numbers,
OEIS [A000125](https://oeis.org/A000125):

```
>>> 1:46.collect { :n |
>>> 	binomial(n, 3) + n
>>> }
[
	    1     2     4     8    15
	   26    42    64    93   130
	  176   232   299   378   470
	  576   697   834   988  1160
	 1351  1562  1794  2048  2325
	 2626  2952  3304  3683  4090
	 4526  4992  5489  6018  6580
	 7176  7807  8474  9178  9920
	10701 11522 12384 13288 14235
	15226
]
```

The pentatope numbers,
OEIS [A000332](https://oeis.org/A000332):

```
>>> 0:43.collect { :n |
>>> 	binomial(n, 4)
>>> }
[
	0 0 0 0 1
	5 15 35 70 126
	210 330 495 715 1001
	1365 1820 2380 3060 3876
	4845 5985 7315 8855 10626
	12650 14950 17550 20475 23751
	27405 31465 35960 40920 46376
	52360 58905 66045 73815 82251
	91390 101270 111930 123410
]
```

The number of Schröder paths from _0,0_ to _2n,0_ having _k_ peaks,
OEIS [A060693](https://oeis.org/A060693):

```
>>> 0:7.triangularArray { :n :k |
>>> 	let a = binomial(n, k);
>>> 	let b = binomial(2 * n - k, n);
>>> 	let c = n - k + 1;
>>> 	a * b / c
>>> }
[
	1;
	1 1;
	2 3 1;
	5 10 6 1;
	14 35 30 10 1;
	42 126 140 70 15 1;
	132 462 630 420 140 21 1;
	429 1716 2772 2310 1050 252 28 1
]
```

Start counting again and again,
OEIS [A002260](https://oeis.org/A002260)
and [A004736](https://oeis.org/A004736):

```
>>> 1:28.collect { :n |
>>> 	let a = 0.5 + (2 * n).sqrt;
>>> 	n - binomial(a.floor, 2)
>>> }
[
	1
	1 2
	1 2 3
	1 2 3 4
	1 2 3 4 5
	1 2 3 4 5 6
	1 2 3 4 5 6 7
]

>>> 1:28.collect { :n |
>>> 	let a = 1.5 + (2 * n).sqrt;
>>> 	binomial(a.floor, 2) - n + 1
>>> }
[
	1
	2 1
	3 2 1
	4 3 2 1
	5 4 3 2 1
	6 5 4 3 2 1
	7 6 5 4 3 2 1
]
```

Sperner’s theorem,
OEIS [A001405](https://oeis.org/A001405);

```
>>> 0:12.collect { :n |
>>> 	n.binomial((n / 2).floor)
>>> }
[1 1 2 3 6 10 20 35 70 126 252 462 924]
```

Triangle of Dyck paths counted by number of long interior inclines,
OEIS [A108838](https://oeis.org/A108838):

```
>>> 2:9.triangularArray { :i :j |
>>> 	let a = binomial(i - 1, j - 2);
>>> 	let b = binomial(i, j);
>>> 	2 * a * b / (i - 1)
>>> }
[
	2;
	3 2;
	4 8 2;
	5 20 15 2;
	6 40 60 24 2;
	7 70 175 140 35 2;
	8 112 420 560 280 48 2;
	9 168 882 1764 1470 504 63 2
]
```

Catalan triangle with zeroes,
OEIS [A053121](https://oeis.org/A053121):

```
>>> 0:10.triangularArray { :n :m |
>>> 	(n < m | { (n - m).isOdd }).if {
>>> 		0
>>> 	} {
>>> 		(m + 1) * binomial(
>>> 			n + 1,
>>> 			(n - m) / 2
>>> 		) / (n + 1)
>>> 	}
>>> }
[
	   1;
	   0   1;
	   1   0   1;
	   0   2   0   1;
	   2   0   3   0   1;
	   0   5   0   4   0   1;
	   5   0   9   0   5   0   1;
	   0  14   0  14   0   6   0  1;
	  14   0  28   0  20   0   7  0  1;
	   0  42   0  48   0  27   0  8  0  1;
	  42   0  90   0  75   0  35  0  9  0  1
]
```

Count partitions into any number of ordered subsets,
OEIS [A000262](https://oeis.org/A000262):

```
>>> (1 .. 9).collect { :n |
>>> 	(0 .. n - 1).sum { :j |
>>> 		binomial(n - 1, j) / (j + 1).!
>>> 	} * n.!
>>> }
[1 3 13 73 501 4051 37633 394353 4596553]
```

The Lah triangle,
a lower triangular matrix of the Jabotinsky type,
OEIS [A105278](https://oeis.org/A105278):

```
>>> 1:7.triangularArray { :j :k |
>>> 	(j - k).!
>>> 	*
>>> 	binomial(j, k)
>>> 	*
>>> 	binomial(j - 1, k - 1)
>>> }
[
	1;
	2 1;
	6 6 1;
	24 36 12 1;
	120 240 120 20 1;
	720 1800 1200 300 30 1;
	5040 15120 12600 4200 630 42 1
]
```

Number of fixed _2k_ polyominoes with _n_ cells,
OEIS [A059678](https://oeis.org/A059678):

```
>>> 2:11.collect { :n |
>>> 	let m = n - 1;
>>> 	1:m.collect { :k |
>>> 		0:k.sum { :v |
>>> 			binomial(
>>> 				n - k + 1,
>>> 				2 * k - n - v
>>> 			) * binomial(
>>> 				n - k + v,
>>> 				n - k
>>> 			)
>>> 		}
>>> 	}
>>> }
[
	1;
	0 4;
	0 1 8;
	0 0 6 12;
	0 0 1 18 16;
	0 0 0 8 38 20;
	0 0 0 1 32 66 24;
	0 0 0 0 10 88 102 28;
	0 0 0 0 1 50 192 146 32;
	0 0 0 0 0 12 170 360 198 36
]
```

Knights-move Pascal triangle,
OEIS [A052509](https://oeis.org/A052509):

```
>>> 0:9.collect { :n |
>>> 	0:n.collect { :k |
>>> 		0:n.sum { :m |
>>> 			binomial(n - k, k - m)
>>> 		}
>>> 	}
>>> }
[
	1;
	1 1;
	1 2 1;
	1 3 2 1;
	1 4 4 2 1;
	1 5 7 4 2 1;
	1 6 11 8 4 2 1;
	1 7 16 15 8 4 2 1;
	1 8 22 26 16 8 4 2 1;
	1 9 29 42 31 16 8 4 2 1
]
```

_Σ(C(n+[2,0,-1],3))_,
OEIS [A006004](https://oeis.org/A006004):

```
>>> 1:12.collect { :n |
>>> 	[2 0 -1].sum { :i |
>>> 		binomial(n + i, 3)
>>> 	}
>>> }
[1 4 11 25 49 86 139 211 305 424 571 749]
```

Where _k=4_,
OEIS [A000332](https://oeis.org/A000332):

```
>>> binomial(0:13, 4)
[0 0 0 0 1 5 15 35 70 126 210 330 495 715]
```

Where _k=5_,
OEIS [A000389](https://oeis.org/A000389):

```
>>> binomial(0:13, 5)
[0 0 0 0 0 1 6 21 56 126 252 462 792 1287]
```

Where _k=6_,
OEIS [A000579](https://oeis.org/A000579):

```
>>> binomial(0:13, 6)
[0 0 0 0 0 0 1 7 28 84 210 462 924 1716]
```

The _q-Stirling2_ numbers at _q=-1_,
OEIS [A065941](https://oeis.org/A065941):

```
>>> 0:9.triangularArray { :n :k |
>>> 	binomial(
>>> 		n - floor((k + 1) / 2),
>>> 		floor(k / 2)
>>> 	)
>>> }
[
	1;
	1 1;
	1 1 1;
	1 1 2 1;
	1 1 3 2 1;
	1 1 4 3 3 1;
	1 1 5 4 6 3 1;
	1 1 6 5 10 6 4 1;
	1 1 7 6 15 10 10 4 1;
	1 1 8 7 21 15 20 10 5 1
]
```

Sierpiński’s triangle,
each row interpreted as an integer in binary notation,
OEIS [A001317](https://oeis.org/A001317):

```
>>> 0:16.collect { :n |
>>> 	0:n.sum { :k |
>>> 		let a = binomial(n, k);
>>> 		(a % 2) * (2 ^ k)
>>> 	}
>>> }
[
	1 3 5 15 17 51 85 255 257 771 1285
	3855 4369 13107 21845 65535 65537
]
```

Ménage numbers,
eliding initial term,
OEIS [A000179](https://oeis.org/A000179):

```
>>> 1:16.collect { :n |
>>> 	2 * n * 0:n.sum { :k |
>>> 		(-1 ^ k)
>>> 		*
>>> 		binomial(2 * n - k, k)
>>> 		*
>>> 		(n - k).!
>>> 		/
>>> 		(2 * n - k)
>>> 	}
>>> }
[
	-1 0
	1 2
	13 80
	579 4738
	43387 439792
	4890741 59216642
	775596313 10927434464
	164806435783 2649391469058
]
```

Triangle formed from even-numbered columns of triangle of expansions of powers of _x_ in terms of Chebyshev polynomials _Un(x)_,
OEIS [A039599](https://oeis.org/A039599):

```
>>> 0:7.triangularArray { :n :m |
>>> 	binomial(2 * n, m + n)
>>> 	*
>>> 	(2 * m + 1)
>>> 	/
>>> 	(m + n + 1)
>>> }
[
	1;
	1 1;
	2 3 1;
	5 9 5 1;
	14 28 20 7 1;
	42 90 75 35 9 1;
	132 297 275 154 54 11 1;
	429 1001 1001 637 273 77 13 1
]
```

Four-dimensional pyramidal numbers,
OEIS [A002415](https://oeis.org/A002415):

```
>>> 0:9.collect { :n |
>>> 	binomial(n ^ 2, 2) / 6
>>> }
[0 0 1 6 20 50 105 196 336 540]
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

Partial sums of Sierpinski’s sieve,
scatter plot,
OEIS [A166556](https://oeis.org/A166556):

~~~spl svg=C oeis=A166556
(0 .. 21).triangularArray { :n :k |
	(k .. n).sum { :j |
		binomial(j, k) % 2
	}
}.++.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-C.svg)

Pascal’s triangle,
excluding first and last two elements of each row,
read by rows,
row _n_ read mod _n_,
OEIS [A053202](https://oeis.org/A053202):

~~~spl svg=D oeis=A053202
4:23.collect { :n |
	let m = n - 2;
	2:m.collect { :k |
		binomial(n, k) % n
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/binomial-D.svg)

The second in a series of arrays counting standard tableaux by partition type,
OEIS [A059797](https://oeis.org/A059797):

~~~spl svg=E oeis=A059797
let t = { :n :k |
	(n < 0 | { k < 0 | { k > n } }).if {
		0
	} {
		t(n - 1, k - 1)
		+
		t(n - 1, k)
		+
		binomial(n + 2, k + 1)
	}
};
0:13.triangularArray(t:/2)
.catenate
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-E.svg)

The number of length-_n_ binary sequences with exactly _k_ zeros,
and without three consecutive zeros,
OEIS [A182309](https://oeis.org/A182309):

~~~spl svg=F oeis=A182309
2:27.collect { :n |
	let m = 2 * (n + 1) / 3;
	2:m.collect { :k |
		let i = k / 2;
		1:i.sum { :j |
			binomial(n - k + 1, j)
			*
			binomial(
				n - k - j + 1,
				k - (2 *j)
			)
		}
	}
}.catenate.log.linePlot
~~~

![](sw/spl/Help/Image/binomial-F.svg)

Circular binomial coefficients,
OEIS [A047996](https://oeis.org/A047996):

~~~spl svg=G oeis=A047996
0:12.triangularArray { :n :k |
	([n k] = [0 0]).if {
		1
	} {
		n.gcd(k).divisorSum { :d |
			d.eulerPhi
			*
			binomial(n / d, k / d)
		} / n
	}
}.catenate.log.discretePlot
~~~

![](sw/spl/Help/Image/binomial-G.svg)

Variant of Pascal’s triangle,
OEIS [A051632](https://oeis.org/A051632):

~~~spl svg=H oeis=A051632
0:13.triangularArray { :n :k |
	let a = (2 * k + 1 - n) / (k + 1);
	let b = 1 - n + (2 * (-k + n));
	let c = (b / (1 - k + n));
	let d = a * binomial(n, k);
	let e = c * binomial(n, -k + n);
	0 - d + e
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-H.svg)

Triangle of coefficients of Laguerre polynomials _n!*Ln(x)_,
OEIS [A021009](https://oeis.org/A021009):

~~~spl svg=I oeis=A021009
0:13.triangularArray { :n :k |
	(-1 ^ k) * n.! * binomial(n, k) / k.!
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-I.svg)

_C(n-a,k/2)×(-1^a)_ where _a=(k+1)/2_,
OEIS [A108299](https://oeis.org/A108299):

~~~spl svg=J oeis=A108299
0:13.triangularArray { :n :k |
	let a = (k + 1) // 2;
	(-1 ^ a) * binomial(n - a, k // 2)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-J.svg)

_-1^(n+k)*C(n,k)_,
lower triangular matrix which is inverse to Pascal’s triangle,
OEIS [A130595](https://oeis.org/A130595):

~~~spl svg=K oeis=A130595
0:11.triangularArray { :n :k |
	(-1 ^ (n + k)) * binomial(n, k)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-K.svg)

Riordan array _((1-x)/(1+x),x/(1+x)^2)_,
OEIS [A110162](https://oeis.org/A110162):

~~~spl svg=L oeis=A110162
0:11.triangularArray { :n :k |
	(n + k = 0).if {
		1
	} {
		let p = n + k;
		let q = n - k;
		let a = binomial(p, q);
		let b = binomial(p - 1, q - 1);
		(-1 ^ q) * (a + b)
	}
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-L.svg)

Riordan array _(1,x(1-x))_,
OEIS [A109466](https://oeis.org/A109466):

~~~spl svg=M oeis=A109466
0:12.triangularArray { :n :k |
	(-1 ^ (n - k)) * binomial(k, n - k)
}.catenate.logScale.discretePlot
~~~

![](sw/spl/Help/Image/binomial-M.svg)

Number of compositions of _n_ with _k_ parts,
OEIS [A109466](https://oeis.org/A109466):

~~~spl svg=N oeis=A109466
0:15.triangularArray { :n :k |
	binomial(n - 1, k - 1)
}.catenate.logScale.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-N.svg)

_C(i,j)*2^(i-j)_,
OEIS [A038207](https://oeis.org/A038207):

~~~spl svg=O oeis=A038207
0:9.triangularArray { :i :j |
	binomial(i, j) * (2 ^ (i - j))
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/binomial-O.svg)

Odd-numbered columns of triangle of expansions of powers of _x_ in terms of Chebyshev polynomials _Un(x)_,
OEIS [A039598](https://oeis.org/A039598):

~~~spl svg=P oeis=A039598
0:15.triangularArray { :n :k |
	binomial(2 * n, n - k)
	-
	binomial(2 * n, n - k - 2)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-P.svg)

_C(2n,n)C(n,k)_,
OEIS [A356546](https://oeis.org/A356546):

~~~spl svg=Q oeis=A356546
0:10.triangularArray { :n :k |
	binomial(2 * n, n) * binomial(n, k)
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/binomial-Q.svg)

The _(1,2)_-Pascal triangle,
_C(n,k)+C(n-1,k-1)_,
OEIS [A029635](https://oeis.org/A029635):

~~~spl svg=R oeis=A029635
0:9.triangularArray { :n :k |
	(n + k = 0).if {
		2
	} {
		binomial(n, k)
		+
		binomial(n - 1, k - 1)
	}
}.catenate.discretePlot
~~~

![](sw/spl/Help/Image/binomial-R.svg)

Denominators of Farey tree fractions,
OEIS [A007306](https://oeis.org/A007306):

~~~spl svg=S oeis=A007306
1:77.collect { :n |
	0:n.sum { :k |
		(n + k - 1).binomial(2 * k) % 2
	}
}.discretePlot
~~~

![](sw/spl/Help/Image/binomial-S.svg)

_C(n+10,n)%10_,
OEIS [A133890](https://oeis.org/A133890):

~~~spl svg=T oeis=A133890
0:115.collect { :n |
	(n + 10).binomial(n) % 10
}.discretePlot
~~~

![](sw/spl/Help/Image/binomial-T.svg)

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
[2](https://mathworld.wolfram.com/CentralBinomialCoefficient.html)
[3](https://mathworld.wolfram.com/Choose.html)
[4](https://mathworld.wolfram.com/CakeNumber.html)
[5](https://reference.wolfram.com/language/ref/Binomial.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/nchoosek.html),
_OEIS_
[1](https://oeis.org/A000125)
[2](https://oeis.org/A000127)
[3](https://oeis.org/A000984)
[4](https://oeis.org/A006542)
[5](https://oeis.org/A027907)
[6](https://oeis.org/A166556)
[7](https://oeis.org/A109449)
[8](https://oeis.org/A000332)
[9](https://oeis.org/A060693)
[10](https://oeis.org/A002260)
[11](https://oeis.org/A004736)
[12](https://oeis.org/A001405)
[13](https://oeis.org/A108838)
[14](https://oeis.org/A053121)
[15](https://oeis.org/A053202),
_Python_
[1](https://docs.sympy.org/latest/modules/functions/combinatorial.html#sympy.functions.combinatorial.factorials.binomial),
_W_
[1](https://en.wikipedia.org/wiki/Binomial_coefficient)
[2](https://en.wikipedia.org/wiki/Cake_number)

Categories: Math, Combinatorics
