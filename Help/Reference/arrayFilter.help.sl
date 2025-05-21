# arrayFilter

- _arrayFilter(aBlock:/1, aList, anInteger)_

Apply _aBlock_ to all _anInteger * 2 + 1_ sublists of _aList_.
The answer has the same shape as the input.
At the boundaries, the edge elements are repeated.

```
>>> identity:/1
>>> .arrayFilter([1 .. 5], 1)
[
	1 1 2;
	1 2 3;
	2 3 4;
	3 4 5;
	4 5 5
]
```

Compute successive differences of elements:

```
>>> { :x |
>>> 	x.last - x.first
>>> }.arrayFilter([1 .. 6], 1)
[
	2 - 1,
	3 - 1,
	4 - 2,
	5 - 3,
	6 - 4,
	6 - 5
]
```

Compute a moving average with runs of three elements using a range-one neighbourhood:

```
>>> mean:/1.arrayFilter([1 .. 5], 1)
[
	(1 + 1 + 2) / 3,
	(1 + 2 + 3) / 3,
	(2 + 3 + 4) / 3,
	(3 + 4 + 5) / 3,
	(4 + 5 + 5) / 3
]
```

* * *

See also: arrayFlatten, blockMap, convolve, movingMap, partition, reshape

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/ArrayFilter.html)
