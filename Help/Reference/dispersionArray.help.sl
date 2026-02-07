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
>>> let r = 1.goldenRatio;
>>> { :n |
>>> 	((n * r) + r + n + 1 - (r / 2))
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

* * *

See also: stolarskyArray

Guides: Integer Sequence Functions
References:
_OEIS_
[1](https://oeis.org/A191426)
[2](https://oeis.org/A035507)
[3](https://oeis.org/A114537)
