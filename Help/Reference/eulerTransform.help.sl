# eulerTransform

- _eulerTransform(f:/1)_

Implement the third type of Euler transform,
defining a relationship between certain types of integer sequences.

The Euler transform of the identity function counts the number of planar partitions,
OEIS [A000219](https://oeis.org/A000219):

```
>>> 0:23.collect(
>>> 	identity:/1.eulerTransform
>>> )
[
	    1      1      3      6     13
	   24     48     86    160    282
	  500    859   1479   2485   4167
	 6879  11297  18334  29601  47330
	75278 118794 186475 290783
]
```

The Euler transform of the square function,
OEIS [A023871](https://oeis.org/A023871):

```
>>> 0:9.collect(
>>> 	square:/1.eulerTransform
>>> )
[1 1 5 14 40 101 266 649 1593 3765]
```

Euler transform of the power of two function,
OEIS [A034899](https://oeis.org/A034899):

```
>>> 0:9.collect(
>>> 	{ :x | 2 ^ x }.eulerTransform
>>> )
[1 2 7 20 59 162 449 1200 3194 8348]
```

Euler transform of the Fibonacci function,
OEIS [A166861](https://oeis.org/A166861):

```
>>> 0:23.collect(
>>> 	fibonacci:/1.eulerTransform
>>> )
[
	     1      1      2       4     8
	    15     30     56     108   203
	   384    716   1342    2487  4614
	  8510  15675  28749   52652 96102
	175110 318240 577328 1045068
]
```

The partition numbers,
OEIS [A000041](https://oeis.org/A000041):

```
>>> 0:21.collect(
>>> 	1.constant
>>> 	.eulerTransform
>>> )
[
	1 1 2 3 5 7 11 15 22 30 42 56 77 101
	135 176 231 297 385 490 627 792
]
```

Functional determinants,
OEIS [A001970](https://oeis.org/A001970):

```
>>> 0:16.collect(
>>> 	1.constant
>>> 	.eulerTransform
>>> 	.eulerTransform
>>> )
[
	1 1 3 6 14 27 58 111 223 424 817
	1527 2870 5279 9710 17622 31877
]
```

Euler transform of powers of two,
OEIS [A034691](https://oeis.org/A034691):

```
>>> 0:15.collect(
>>> 	{ :x |
>>> 		2 ^ (x - 1)
>>> 	}.eulerTransform
>>> )
[
	1 1 3 7 18 42 104 244 585 1373 3233
	7533 17547 40591 93711 215379
]
```

Euler transform of `divisorSigma`,
OEIS [A061256](https://oeis.org/A061256):

```
>>> 0:16.collect(
>>> 	{ :x |
>>> 		1.divisorSigma(x)
>>> 	}.eulerTransform
>>> )
[
	1 1 4 8 21 39 92 170 360 667 1316
	2393 4541 8100 14824 26071 46422
]
```

Euler transform of `tetrahedralNumber`,
OEIS [A000335](https://oeis.org/A000335):

```
>>> 1:14.collect(
>>> 	tetrahedralNumber:/1
>>> 	.eulerTransform
>>> )
[
	1 5 15 45 120 331 855 2214 5545
	13741 33362 80091 189339 442799
]
```

Euler transform of `eulerPhi`,
OEIS [A061255](https://oeis.org/A061255):

```
>>> 0:19.collect(
>>> 	eulerPhi:/1
>>> 	.eulerTransform
>>> )
[
	1 1 2 4 7 13 21 37 60 98 157 251 392
	612 943 1439 2187 3293 4930 7330
]
```

* * *

See also: binomialTransform, boustrophedonTransform, divisors, memoize, sum

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/EulerTransform.html),
_OEIS_
[1](https://oeis.org/A000219)
[2](https://oeis.org/A023871)
[3](https://oeis.org/A034899)
[4](https://oeis.org/A166861)
