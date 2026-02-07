# dispersionArray

- _dispersionArray(f:/1, [m n])_

Answer the _m×n_ dispersion array of the sequence specified by _f(x)_.

Dispersion array of _3+(nφ)_,
OEIS [A191426](https://oeis.org/A191426):

```
>>> { :n |
>>> 	(n.goldenRatio + 3).floor
>>> }.dispersionArray([5 5])
[
	1  4  9 17 30;
	2  6 12 22 38;
	3  7 14 25 43;
	5 11 20 35 59;
	8 15 27 46 77
]
```

Inverse Stolarsky array,
OEIS [A035507](https://oeis.org/A035507):

```
>>> let x = 1.goldenRatio;
>>> { :n |
>>> 	((n * x) + x + n + 1 - (x / 2))
>>> 	.floor
>>> }.dispersionArray([5 6])
[
	1   4  12  33  88 232;
	2   7  20  54 143 376;
	3   9  25  67 177 465;
	5  14  38 101 266 698;
	6  17  46 122 321 842
]
```

Dispersion array of the primes,
OEIS [A114537](https://oeis.org/A114537):

```
>>> prime:/1.dispersionArray([6 6])
[
	 1   2   3    5    11     31;
	 4   7  17   59   277   1787;
	 6  13  41  179  1063   8527;
	 8  19  67  331  2221  19577;
	 9  23  83  431  3001  27457;
	10  29 109  599  4397  42043
]
```

Wythoff array,
OEIS [A035513](https://oeis.org/A035513):

```
>>> let x = 1.goldenRatio;
>>> { :n |
>>> 	(n * x + x - 1).floor
>>> }.dispersionArray([9 9])
[
	 1   2   3   5   8  13  21  34   55;
	 4   7  11  18  29  47  76 123  199;
	 6  10  16  26  42 68  110 178  288;
	 9  15  24  39  63 102 165 267  432;
	12  20  32  52  84 136 220 356  576;
	14  23  37  60  97 157 254 411  665;
	17  28  45  73 118 191 309 500  809;
	19  31  50  81 131 212 343 555  898;
	22  36  58  94 152 246 398 644 1042
]
```

Stolarsky array,
OEIS [A035506](https://oeis.org/A035506):

```
>>> let x = 1.goldenRatio;
>>> { :n |
>>> 	(n * x).round
>>> }.dispersionArray([6 9])
[
	 1   2   3   5   8  13  21  34  55;
	 4   6  10  16  26  42  68 110 178;
	 7  11  18  29  47  76 123 199 322;
	 9  15  24  39  63 102 165 267 432;
	12  19  31  50  81 131 212 343 555;
	14  23  37  60  97 157 254 411 665
]
```

Dispersion array of _⌊(n×e)_,
OEIS [A191455](https://oeis.org/A191455):

```
>>> { :n |
>>> 	n.e.floor
>>> }.dispersionArray([5 5])
[
	1    2    5    13   35;
	3    8   21    57  154;
	4   10   27    73  198;
	6   16   43   116  315;
	7   19   51   138  375
]
```

* * *

See also: stolarskyArray, wythoffArray

Guides: Integer Sequence Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/SequenceDispersion.html)
[2](https://mathworld.wolfram.com/Interspersion.html),
_OEIS_
[1](https://oeis.org/A191426)
[2](https://oeis.org/A035507)
[3](https://oeis.org/A114537)
[4](https://oeis.org/A035513)
[5](https://oeis.org/A035506)
[6](https://oeis.org/A191455)

Further Reading: Kimberling 1993
