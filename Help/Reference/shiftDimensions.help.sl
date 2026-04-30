# shiftDimensions

- _shiftDimensions(a, n)_

Shift the dimensions of the array _a_ by _n_ positions.

```
>>> let a = [2 3 4].iota;
>>> let b = a.shiftDimensions(1);
>>> (a.shape, b.shape, a, b)
(
	[2 3 4],
	[3 4 2],
	[
		 1  2  3  4;
		 5  6  7  8;
		 9 10 11 12
		:;
		13 14 15 16;
		17 18 19 20;
		21 22 23 24
	],
	[
		 1  2;
		 3  4;
		 5  6;
		 7  8
		:;
		 9 10;
		11 12;
		13 14;
		15 16
		:;
		17 18;
		19 20;
		21 22;
		23 24
	]
)
```

* * *

See also: reshape, shape

Guides: Array Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/shiftdim.html)
