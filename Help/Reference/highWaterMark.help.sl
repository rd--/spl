# highWaterMark

- _highWaterMark([x₁ x₂ …])_

Find the high water marks of a list.
Answers two lists, the first giving the high water marks,
the second the indices in _x_ where they occur.

```
>>> let a = [3 5 7 8 8 5 7 9 2 5];
>>> (a.runningMax, a.highWaterMark)
(
	[3 5 7 8 8 8 8 9 9 9],
	[
		3 5 7 8 9;
		1 2 3 4 8
	]
)
```

* * *

See also: max, runningMax

Guides: List Functions

References:
_Mathematica_
[1](https://mathworld.wolfram.com/High-WaterMark.html)
