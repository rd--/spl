# fussCatalanNumber

- _fussCatalanNumber(p, r, m)_

Answer the Fuss-Catalan number _Aₘ(p,r)_,
also called Raney numbers.

Evaluate at integers:

```
>>> fussCatalanNumber(3, 1, 5)
273

>>> fussCatalanNumber(3, 1, 6)
1428

>>> fussCatalanNumber(7, 1, 5)
10472
```

Evaluate at half-integers:

```
>>> fussCatalanNumber(3 / 2, 1, 7)
46189/1024
```

The binary form answers a unary block:

```
>>> 1:4.collect(fussCatalanNumber(5, 1))
[1 5 35 285]
```

Threads over lists:

```
>>> fussCatalanNumber(5, 1, 1:4)
[1 5 35 285]
```

Where _p=0_ answers binomial coefficients:

```
>>> 1:5.triangularArray { :r :m |
>>> 	fussCatalanNumber(0, r, m)
>>> }
[
	1;
	2 1;
	3 3 1;
	4 6 4 1;
	5 10 10 5 1
]
```

Where _p=1_ answers Pascal’s triangle at diagonals,
OEIS [A007318](https://oeis.org/A007318):

```
>>> { :r :m |
>>> 	fussCatalanNumber(1, r, m)
>>> }.table(1:6, 0:5)
[
	1   1   1   1   1   1;
	1   2   3   4   5   6;
	1   3   6  10  15  21;
	1   4  10  20  35  56;
	1   5  15  35  70 126;
	1   6  21  56 126 252
]
```

Where _p=2_ and _r=1_ answers the Catalan numbers,
OEIS [A000108](https://oeis.org/A000108):

```
>>> fussCatalanNumber(2, 1, 0:10)
[1 1 2 5 14 42 132 429 1430 4862 16796]
```

With _p=2_ and _r=3_,
OEIS [A000245](https://oeis.org/A000245):

```
>>> fussCatalanNumber(2, 3, 0:9)
[1 3 9 28 90 297 1001 3432 11934 41990]
```

With _p=2_ and _r=4_,
OEIS [A002057](https://oeis.org/A002057)

```
>>> fussCatalanNumber(2, 4, 0:8)
[1 4 14 48 165 572 2002 7072 25194]
```

With _p=3_ and _r=1_,
OEIS [A001764](https://oeis.org/A001764)

```
>>> fussCatalanNumber(3, 1, 0:8)
[1 1 3 12 55 273 1428 7752 43263]
```

With _p=4_ and _r=1_,
OEIS [A002293](https://oeis.org/A002293)

```
>>> fussCatalanNumber(4, 1, 0:7)
[1 1 4 22 140 969 7084 53820]
```

* * *

See also: binomial, catalanNumber, catalanStrings, catalanTriangle

Guides: Combinatorial Functions

References:
_OEIS_
[1](https://oeis.org/A007318)
[2](https://oeis.org/A000108)
[3](https://oeis.org/A000245)
[4](https://oeis.org/A002057)
[5](https://oeis.org/A001764)
[6](https://oeis.org/A002293),
_W_
[1](https://en.wikipedia.org/wiki/Fuss%E2%80%93Catalan_number)
