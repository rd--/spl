# differences

- _differences(aSequence)_

Answer the successive differences of elements in list.

Differences of a `Range`:

```
>>> 1:5.differences
[1 1 1 1]
```

At `List`:

```
>>> [3 4 1 1].differences
[1 -3 0]
```

First differences are constant for a linear function:

```
>>> let l = 0:10.collect { :i |
>>> 	3 * i + 6
>>> };
>>> let d = l.differences;
>>> (l, d)
(
	[6 9 12 15 18 21 24 27 30 33 36],
	[3 3 3 3 3 3 3 3 3 3]
)
```

Second differences are constant for a quadratic function:

```
>>> let l = 0:10.collect { :i |
>>> 	3 * (i ^ 2) + 6
>>> };
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
>>> let l = 1:8.collect { :n |
>>> 	n ^ 5 + (2 * n) - 1
>>> };
>>> differences:/1.nestList(l, 2)
[
	2 35 248 1031 3134 7787 16820 32783;
	33 213 783 2103 4653 9033 15963;
	180 570 1320 2550 4380 6930
]
```

The differences of a `prefixSum`:

```
>>> 1:10.prefixSum.differences
[2 3 4 5 6 7 8 9 10]
```

Successive differences modulo two of a sequence based on the primes:

~~~spl svg=A
let k = 20;
let m = differences:/1.nestList(
	k.primesList - 1 / 2,
	k
).collect { :each |
	each.padLeft([k], 0)
};
(m % 2).matrixPlot
~~~

![](sw/spl/Help/Image/differences-A.svg)

* * *

See also: -, accumulate, foldList, prefixSum, ratios

References:
_Mathematica_
[1](https://mathworld.wolfram.com/CommonDifference.html)
[2](https://reference.wolfram.com/language/ref/Differences.html),
_SuperCollider_
[1](https://doc.sccode.org/Classes/SequenceableCollection.html#-differentiate)

Categories: Math
