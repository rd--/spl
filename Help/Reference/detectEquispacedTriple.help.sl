# detectEquispacedTriple

- _detectEquispacedTriple([x₁ x₂ …], f:/3)_

Answer the indices of the first equally spaced subsequence of _x_ for which _f_ answers `true`,
or `nil` if there is no such subsequence.

Detect arithmetic progression at intervals of one, two, three and four at delays of zero and one:

```
>>> [
>>> 	;
>>> 	0;
>>> 	0  0;
>>> 	1  2  3;
>>> 	1  0  3  0  5;
>>> 	0  2  0  4 -1  6;
>>> 	1  0  0  4  0  0  7;
>>> 	0  2  0  0  5  0 -1  8;
>>> 	1  0  0 -1  5  0  0 -1  9;
>>> 	0  2  0  0 -1  6 -1 -1  0 10;
>>> 	1  1  2  1  1  2  2  4  4  1  1
>>> ].collect { :each |
>>> 	each
>>> 	.detectEquispacedTriple { :a :b :c |
>>> 		(2 * b) = (a + c)
>>> 	}
>>> }
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
	[2 6 10],
	nil
]
```

* * *

See also: detect, equispacedTriples

Guides: List Functions
