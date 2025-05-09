# deinterleave

- _deinterleave(l, n)_

Deinterleave a 4 vector into a 2×2 matrix:

```
>>> [1 2 3 4].deinterleave(2)
[
	1 3;
	2 4
]
```

Deinterleave a 9 vector into a 3×3 matrix:

```
>>> [1 .. 9].deinterleave(3)
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

Equivalent to `transposed` of `partition`:

```
>>> [1 .. 9].partition(3, 3).transposed
[
	1 4 7;
	2 5 8;
	3 6 9
]
```

The inverse is `interleave`:

```
>>> [1 .. 9].deinterleave(3).interleave
[1 .. 9]
```

* * *

See also: flatten, interleave, partition, transposed
