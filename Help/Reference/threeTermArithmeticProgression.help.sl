# threeTermArithmeticProgression

- _threeTermArithmeticProgression(x)_

Answer the indices of the first equally spaced subsequence of _x_ that forms a three term arithmetic progression,
or `nil` if there is no such subsequence.

Detect arithmetic progression at intervals of one, two, three and four at delays of zero and one:

```
>>> [
>>> 	;
>>> 	1;
>>> 	1 1;
>>> 	1 2 3;
>>> 	1 0 2 0 3;
>>> 	0 1 0 2 9 3;
>>> 	1 0 0 2 0 0 3;
>>> 	0 1 0 0 2 0 9 3;
>>> 	1 0 0 9 2 0 0 9 3;
>>> 	0 1 0 0 9 2 9 0 9 3;
>>> 	1 1 2 1 1 2 2 4 4 1 1
>>> ].collect(
>>> 	threeTermArithmeticProgression:/1
>>> )
[
	nil,
	nil,
	nil,
	[1 2 3],
	[1 3 5],
	[2 4 6],
	[1 4 7],
	[2 5 8],
	[1 5 9],
	[5 7 9],
	nil
]
```

* * *

See also: ArithmeticProgression, forestFireSequence, isArithmeticProgression

Guides: List Functions
