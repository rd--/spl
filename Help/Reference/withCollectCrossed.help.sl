# withCollectCrossed

- _withCollectCrossed(u, v)_

A variant on `withCollectTable` that removes one layer of stucture.

```
>>> [10 20 30 40 50].withCollectCrossed(
>>> 	[1 2 3],
>>> 	+
>>> )
[
	11 12 13
	21 22 23
	31 32 33
	41 42 43
	51 52 53
]

>>> [10 20 30 40 50] +.x [1 2 3]
[
	11 12 13
	21 22 23
	31 32 33
	41 42 43
	51 52 53
]
```

The matrix form is likewise folded.

```
>>> let x = [4 4.5; 2 3 5 6];
>>> x.withCollectCrossed(x, *)
[
	16 20.25;
	 8 13.5 20 27;
	 8 13.5 20 27;
	 4  9   25 36
]
```

* * *

See also: withCollectTable

Guides: Matrix Functions, Vector Functions

Categories: Arithmetic
