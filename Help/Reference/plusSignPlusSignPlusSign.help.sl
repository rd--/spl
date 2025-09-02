# +++ (plusSignPlusSignPlusSign)

- _m₁ ++ m₂_

Append matrices.

Join two 2×2 matrices into a 2×4 matrix using `+++`:

```
>>> [1 2; 3 4] +++ [5 6; 7 8]
[
	1 2 5 6;
	3 4 7 8
]
```

Join two 2×2 matrices into a 4×2 matrix using `++`:

```
>>> [1 2; 3 4] ++ [5 6; 7 8]
[
	1 2;
	3 4;
	5 6;
	7 8
]
```

Join two 2×2 matrices into a 2×4 matrix using `++` and `each`:

```
>>> [1 2; 3 4] ++.each [5 6; 7 8]
[
	1 2 5 6;
	3 4 7 8
]
```

Join a 2×3 and 1×1 into a 2×4 matrix:

```
>>> [1 2 3; 4 5 6] +++ [4; 7]
[
	1 2 3 4;
	4 5 6 7
]
```

Wraps around at right hand side if required:

```
>>> [1 2; 3 4; 5 6] +++ [7 8; 9 10]
[
	1  2  7  8;
	3  4  9 10;
	5  6  7  8
]
```

The name of this operator is `plusSignPlusSignPlusSign`.

* * *

See also: ++, catenate, flatten, join

Guides: Matrix Functions

Categories: Rearranging
