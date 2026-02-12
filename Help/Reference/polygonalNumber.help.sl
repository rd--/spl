# polygonalNumber

- _polygonalNumber(r, n)_

Answer the _n_-th _r_-gonal number.

Return the first 18 triangular numbers,
OEIS [A000217](https://oeis.org/A000217):

```
>>> 0:17.collect { :n |
>>> 	3.polygonalNumber(n)
>>> }
[
	  0   1   3   6  10
	 15  21  28  36  45
	 55  66  78  91 105
	120 136 153
]
```

Return the tenth r-gonal number of several regular polygons,
OEIS [A139610](https://oeis.org/A139610):

```
>>> 2:15.collect { :r |
>>> 	r.polygonalNumber(10)
>>> }
[
	 10  55 100 145 190
	235 280 325 370 415
	460 505 550 595
]

>>> 0:13 * 45 + 10
[
	 10  55 100 145 190
	235 280 325 370 415
	460 505 550 595
]
```

`polygonalNumber` with integer arguments:

```
>>> 5.polygonalNumber(3)
12

>>> 3.polygonalNumber(5)
15
```

Central polygonal numbers,
OIES [A000124](https://oeis.org/A000124):

```
>>> 0:52.collect { :n |
>>> 	3.polygonalNumber(n) + 1
>>> }
[
	   1    2    4    7   11
	  16   22   29   37   46
	  56   67   79   92  106
	 121  137  154  172  191
	 211  232  254  277  301
	 326  352  379  407  436
	 466  497  529  562  596
	 631  667  704  742  781
	 821  862  904  947  991
	1036 1082 1129 1177 1226
	1276 1327 1379
]
```

Table of first few terms of first few polygonal numbers,
OEIS
[A000027](https://oeis.org/A000027),
[A000217](https://oeis.org/A000217),
[A000290](https://oeis.org/A000290),
[A000326](https://oeis.org/A000326),
[A000384](https://oeis.org/A000384),
[A000566](https://oeis.org/A000566),
[A000567](https://oeis.org/A000567),
[A001106](https://oeis.org/A001106),
[A001107](https://oeis.org/A001107),
[A051682](https://oeis.org/A051682),
[A051864](https://oeis.org/A051864),
[A051865](https://oeis.org/A051865),
[A051866](https://oeis.org/A051866),
[A051867](https://oeis.org/A051867),
[A051868](https://oeis.org/A051868),
[A051869](https://oeis.org/A051869),
[A051870](https://oeis.org/A051870),
[A051871](https://oeis.org/A051871),
[A051872](https://oeis.org/A051872),
[A051873](https://oeis.org/A051873),
[A051874](https://oeis.org/A051874),
[A051875](https://oeis.org/A051875),
[A051876](https://oeis.org/A051876):

```
>>> polygonalNumber:/2.table(2:25, 1:10)
[
	1 2 3 4 5 6 7 8 9 10;
	1 3 6 10 15 21 28 36 45 55;
	1 4 9 16 25 36 49 64 81 100;
	1 5 12 22 35 51 70 92 117 145;
	1 6 15 28 45 66 91 120 153 190;
	1 7 18 34 55 81 112 148 189 235;
	1 8 21 40 65 96 133 176 225 280;
	1 9 24 46 75 111 154 204 261 325;
	1 10 27 52 85 126 175 232 297 370;
	1 11 30 58 95 141 196 260 333 415;
	1 12 33 64 105 156 217 288 369 460;
	1 13 36 70 115 171 238 316 405 505;
	1 14 39 76 125 186 259 344 441 550;
	1 15 42 82 135 201 280 372 477 595;
	1 16 45 88 145 216 301 400 513 640;
	1 17 48 94 155 231 322 428 549 685;
	1 18 51 100 165 246 343 456 585 730;
	1 19 54 106 175 261 364 484 621 775;
	1 20 57 112 185 276 385 512 657 820;
	1 21 60 118 195 291 406 540 693 865;
	1 22 63 124 205 306 427 568 729 910;
	1 23 66 130 215 321 448 596 765 955;
	1 24 69 136 225 336 469 624 801 1000;
	1 25 72 142 235 351 490 652 837 1045
]
```

Second differences for polygonal numbers _r_ are constant at _r-2_:

```
>>> 2:25.collect { :r |
>>> 	1:10.collect { :n |
>>> 		r.polygonalNumber(n)
>>> 	}.differences(2)
>>> 	.allSatisfy { :d |
>>> 		d = (r - 2)
>>> 	}
>>> }.allTrue
true
```

Plot triangular numbers:

~~~spl svg=A
0:23.collect { :n |
	3.polygonalNumber(n)
}.linePlot
~~~

![](sw/spl/Help/Image/polygonalNumber-A.svg)

Plot triangular array of polygonal numbers:

~~~spl svg=B
0:17.triangularArray(
	polygonalNumber:/2
).catenate.scatterPlot
~~~

![](sw/spl/Help/Image/polygonalNumber-B.svg)

Plot antidiagonalArray array of polygonal numbers,
OEIS [A134394](https://oeis.org/A134394):

~~~spl svg=C
17.antidiagonalArray { :i :j |
	(i + 1).polygonalNumber(j)
}.++.scatterPlot
~~~

![](sw/spl/Help/Image/polygonalNumber-C.svg)

* * *

See also: ^, binomial, simplicialPolytopicNumber, triangularNumber

Guides: Combinatorial Functions, Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/PolygonalNumber.html)
[2](https://reference.wolfram.com/language/ref/PolygonalNumber.html),
_OEIS_
[1](https://oeis.org/A000217)
[2](https://oeis.org/A139610)
[3](https://oeis.org/A000124),
_W_
[1](https://en.wikipedia.org/wiki/Polygonal_number)
[2](https://en.wikipedia.org/wiki/Triangular_number)
[3](https://en.wikipedia.org/wiki/Lazy_caterer%27s_sequence)

Categories: Math, Combinations
