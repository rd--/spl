# differences

- _differences(aSequence)_

Answer the successive differences of elements in list.

Differences of a `Range`:

```
>>> 1:5.differences
[1 1 1 1]
```

First differences are constant for a linear function:

```
>>> let l = 0:10.collect { :i | 3 * i + 6 };
>>> let d = l.differences;
>>> (l, d)
(
	[6 9 12 15 18 21 24 27 30 33 36],
	[3 3 3 3 3 3 3 3 3 3]
)
```

Second differences are constant for a quadratic function:

```
>>> let l = 0:10.collect { :i | 3 * (i ^ 2) + 6 };
>>> let d = l.differences;
>>> (l, d, d.differences)
(
	[6 9 18 33 54 81 114 153 198 249 306],
	[ 3 9 15 21 27 33 39 45 51 57],
	[6 6 6 6 6 6 6 6 6]
)
```

Deduce the degree of a sequence by seeing when successive differences become constant:

```
>>> let l = 1:8.collect { :n | n ^ 5 + (2 * n) - 1 };
>>> differences:/1.nestList(l, 2)
[
	2 35 248 1031 3134 7787 16820 32783;
	33 213 783 2103 4653 9033 15963;
	180 570 1320 2550 4380 6930
]
```

* * *

See also: -, ratios

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CommonDifference.html)
[2](https://reference.wolfram.com/language/ref/Differences.html)

Categories: Math
