# minMax

- _minMax(aCollection)_
- _minMax(aMagnitude, firstMagnitude, secondMagnitude)_

The unary form scans for minimum and maximum in one pass returning the results as a two-element `List`.

The ternary form takes _aMagnitude_ or _firstMagnitude_,
whichever is the lesser magnitude,
and answers that or _secondMagnitude_,
whichever is the greater magnitude.

Find the minimum and maximum of a `Range`:

```
>>> 1:4.minMax
[1 4]
```

Find the minimum and maximum of a `List`:

```
>>> [1.pi 1.3 1.e 10.sqrt].minMax
[1.3 10.sqrt]

>>> [3 1 2 5 4].minMax
[1 5]

>>> [3 3 3 3 3].minMax
[3 3]

>>> [2 4 -1 10 6 3 0 -16].minMax
[-16 10]
```

Minimum and maximum values of matrix columns and rows:

```
>>> let m = [
>>> 	16 2 3 13;
>>> 	5 11 10 8;
>>> 	9 7 6 12;
>>> 	4 14 15 1
>>> ];
>>> (m.minMax, m.transposed.minMax)
(
	[4 2 3 1; 16 14 15 13],
	[2 5 6 1; 16 11 12 15]
)
```

* * *

See also: min, max

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/MinMax.html),
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/bounds.html)

Categories: Math
