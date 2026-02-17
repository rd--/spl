# collatzSequence

- _collatzSequence(n)_
- _collatzSequence(n/d)_
- _collatzSequence(n, p, k='Indirect')_

Answer the Collatz sequence of integers,
starting with _n_,
in which each term is obtained from the previous term as either

1. _n_ is even, then _n/2_
2. _n_ is odd, _n*3+1_

Also called a hailstone sequence.

The sequence starting at three, which arrives at `one` after seven steps,
OEIS [A033478](https://oeis.org/A033478):

```
>>> 3.collatzSequence
[3 10 5 16 8 4 2 1]
```

The sequence starting at seven, which arrives at `one` after sixteen steps:

```
>>> 7.collatzSequence
[
	 7 22 11 34 17 52 26 13 40 20
	10  5 16  8  4  2  1
]
```

The sequence starting at nine, which arrives at `one` after nineteen steps:

```
>>> 9.collatzSequence
[
	9 28 14 7 22 11 34 17 52 26
	13 40 20 10 5 16 8 4 2 1
]
```

The table of sequences obtained for the first few starting values,
OEIS [A070165](http://oeis.org/A070165):

```
>>> 1:6.collect(collatzSequence:/1)
[
	1;
	2 1;
	3 10 5 16 8 4 2 1;
	4 2 1;
	5 16 8 4 2 1;
	6 3 10 5 16 8 4 2 1
]
```

The number of steps required to reach one for the first few integers,
OEIS [A006577](https://oeis.org/A006577):

```
>>> 1:18.collect { :each |
>>> 	each.collatzSequence.size - 1
>>> }
[0 1 7 2 5 8 16 3 19 6 14 9 9 17 17 4 12 20]
```

Plot
OEIS [A006577](https://oeis.org/A006577):

~~~spl svg=A
1:200.collect { :each |
	each.collatzSequence.size
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-A.svg)

Plot the `log` of the maximum value in each orbit for the first few integers:

~~~spl svg=B
1:200.collect { :each |
	each.collatzSequence.max.log
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-B.svg)

Plot the orbit for twenty-seven, which has one-hundred and twelve places:

~~~spl svg=C
27.collatzSequence.linePlot
~~~

![](sw/spl/Help/Image/collatzSequence-C.svg)

Plot numbers sorted by their Collatz stopping time,
OEIS [A127824](https://oeis.org/A127824):

~~~spl svg=D
let s = [1];
let t = 1:15.collect { :unused |
	let u = s.select { :x |
		x % 3 = 1 & {
			let y = (x - 1) / 3;
			y.isOdd & {
				y > 1
			}
		}
	} - 1 / 3;
	s := ((2 * s) ++ u).nub.sort;
	s
};
([1] ++ t.catenate).log.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-D.svg)

There is also a variant defined for rational numbers of the form _1/(2n+1)_,
where the parity of the numerator is considered,
and the sequence ends by visiting an already visited term.

The sequence starting at _1/3_:

```
>>> 1/3.collatzSequence
[1/3 2 1 4 2]
```

The first few sequences:

```
>>> let n = 3:13:2;
>>> Fraction(1, n)
>>> .collect(collatzSequence:/1) * n
[
	1 6 3 12 6;
	1 8 4 2 1;
	1 10 5 22 11 40 20 10;
	1 12 6 3 18 9 36 18;
	1 14 7 32 16 8 4 2 1;
	1 16 8 4 2 1
]
```

Plot first few sequences:

~~~spl svg=E
1:15.collect { :n |
	let x = Fraction(1, (2 * n + 1));
	x.collatzSequence
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-E.svg)

Plot sequence lengths,
according to OEIS [A210468](https://oeis.org/A210468):

~~~spl svg=F
1:66.collect { :n |
	let x = Fraction(1, (2 * n + 1));
	let y = x.collatzSequence;
	let k = y.size;
	let e = y.last;
	k - 2 - (e = 2).boole
}.discretePlot
~~~

![](sw/spl/Help/Image/collatzSequence-F.svg)

There are also variants defined for both the indirect and direct _Px+1_ sequences.

Trajectory of 29 under the _29x+1_ maps,
OEIS [A057687](https://oeis.org/A057687):

```
>>> 29.collatzSequence(29, 'Indirect')
[
	[
		29  842  421 12210 6105
		2035  407   37  1074  537
		179 5192 2596  1298  649
		59 1712  856   428  214
		107 3104 1552   776  388
		194   97 2814  1407  469
		67 1944  972   486  243
		81   27    9     3    1
		30   15    5
	],
	1
]

>>> 29.collatzSequence(29, 'Direct')
[[29 421 37 179 59 107 97 67 1], 1]
```

Trajectory of 23 under the _23x+1_ maps,
OEIS [A057686](https://oeis.org/A057686):

```
>>> 23.collatzSequence(23, 'Indirect')
[
	[
		 23 530 265   53 1220
		610 305  61 1404  702
		351 117  39   13    1
		 24  12   6   3
	],
	1
]

>>> 23.collatzSequence(23, 'Direct')
[[23 53 61 1], 1]
```

Trajectory of 19 under the _19x+1_ maps,
OEIS [A057685](https://oeis.org/A057685):

```
>>> 19.collatzSequence(19, 'Indirect')
[
	[
		   19  362  181  3440  1720
		  860  430  215    43   818
		  409 7772 3886  1943 36918
		18459 6153 2051   293  5568
		 2784 1392  696   348   174
		   87   29  552   276   138
		   69   23  438   219    73
		 1388  694  347  6594  3297
		 1099  157 2984  1492   746
		  373 7088 3544  1772   886
		  443 8418 4209  1403 26658
		13329 4443 1481 28140 14070
		 7035 2345  469    67  1274
		  637   91   13     1    20
		   10    5
	],
	1
]

>>> 19.collatzSequence(19, 'Direct')
[
	[
		 19 181  43  409 1943
		293  29  23   73  347
		157 373 443 1403 1481
		 67   1
	],
	1
]
```

Trajectory of 5 under the _5x+1_ maps,
OEIS [A057688](https://oeis.org/A057688):

```
>>> 5.collatzSequence(5, 'Indirect')
[
	[
		 5 26 13 66 33
		11 56 28 14  7
		36 18  9  3  1
		 6
	],
	3
]

>>> 5.collatzSequence(5, 'Direct')
[[5 13 11 7 1], 1]
```

Trajectory of 17 under the _11x+1_ maps,
OEIS [A057614](https://oeis.org/A057614):

```
>>> 17.collatzSequence(11, 'Indirect')
[
	[
		 17 188  94  47 518
		259  37 408 204 102
		 51
	],
	17
]

>>> 17.collatzSequence(11, 'Direct')
[[17 47 37], 17]
```

Trajectory of 61 under the _17x+1_ maps,
OEIS [A057534](https://oeis.org/A057534)
& [A057216](https://oeis.org/A057216):

```
>>> 61.collatzSequence(17, 'Indirect')
[
	[
		    61   1038    519    173
		  2942   1471  25008  12504
		  6252   3126   1563    521
		  8858   4429  75294  37647
		 12549   4183  71112  35556
		 17778   8889   2963  50372
		 25186  12593   1799    257
		  4370   2185    437   7430
		  3715    743  12632   6316
		  3158   1579  26844  13422
		  6711   2237  38030  19015
		  3803  64652  32326  16163
		  2309  39254  19627 333660
		166830  83415  27805   5561
		 94538  47269 803574 401787
		133929  44643  14881 252978
		126489  42163   3833  65162
		 32581 553878 276939  92313
		 30771  10257   3419    263
		  4472   2236   1118    559
		    43    732    366    183
	],
	61
]

>>> 61.collatzSequence(17, 'Direct')
[
	[
		  61   173  1471   521  4429
		4183  2963   257   437   743
		1579  2237  3803  2309 19627
		5561 47269 14881  3833 32581
		 263    43
	],
	61
]
```

Trajectory of 73 under the _13x+1_ maps,
OEIS [A057522](https://oeis.org/A057522)
& [A057446](https://oeis.org/A057446):

```
>>> 73.collatzSequence(13, 'Indirect')
[
	[
		 73 950 475   95  19
		248 124  62   31 404
		202 101 1314 657 219
	],
	73
]

>>> 73.collatzSequence(13, 'Direct')
[[73 19 31 101], 73]
```

Trajectory of 13 under the _13x+1_ maps,
OEIS [A057684](https://oeis.org/A057684):

```
>>> 13.collatzSequence(13, 'Indirect')
[
	[
		  13   170    85   17  222
		 111    37   482  241 3134
		1567 20372 10186 5093  463
		6020  3010  1505  301   43
		 560   280   140   70   35
		   7     1    14
	],
	7
]

>>> 13.collatzSequence(13, 'Direct')
[[13 17 37 241 1567 463 43 1], 1]
```

Plot trajectory of 109 under the _109x+1_ map:

~~~spl svg=G
109.collatzSequence(109, 'Indirect')
.first
.log
.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-G.svg)

Number of terms before entering cycle in trajectory of _p(n)_,
OEIS [A057691](https://oeis.org/A057691):

```
>>> 2:76.prime.collect { :p |
>>> 	let [x, y] = p.collatzSequence(
>>> 		p,
>>> 		'Indirect'
>>> 	);
>>> 	x.indexOf(y) - 1
>>> }
[
	  5 13  4  10  25 11  68  14 39 34
	  9  4  5   5  16 16 234  23 16  5
	 11  5 63 116  18 18  33 288 47 29
	317 14 12  61  60  6  16  10  5 14
	 46  5  6  15 105  4  11  48 44  5
	  6 10  5  55  15 14  25  17  9 16
	  6  7 26   5  33 46   5  16 23 13
	 15 11 16  14  11
]
```

Plot
OEIS [A057691](https://oeis.org/A057691):

~~~spl svg=H
2:76.prime.collect { :p |
	let [x, y] = p.collatzSequence(
		p,
		'Indirect'
	);
	x.indexOf(y) - 1
}.log.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-H.svg)

Plot first few indirect sequences:

~~~spl svg=I
2:17.prime.collect { :p |
	p.collatzSequence(
		p,
		'Indirect'
	).first
}.catenate.log.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-I.svg)

Plot the number of iterations required to reach a power of two in the Collatz sequence starting at _n_,
OEIS [A208981](https://oeis.org/A208981):

~~~spl svg=J
1:165.collect { :n |
	n.collatzSequence.detectIndex { :x |
		x.log2.isInteger
	} - 1
}.scatterPlot
~~~

![](sw/spl/Help/Image/collatzSequence-J.svg)

* * *

See also: isEven, isOdd, nestWhileList

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CollatzProblem.html)
[2](https://mathworld.wolfram.com/HailstoneNumber.html),
_OEIS_
[1](https://oeis.org/A070165)
[2](https://oeis.org/A008884)
[3](https://oeis.org/A006877)
[4](https://oeis.org/A006577)
[5](https://oeis.org/A127824),
_W_
[1](https://en.wikipedia.org/wiki/Collatz_conjecture)
