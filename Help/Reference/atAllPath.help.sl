# atAllPath

- _atAllPath(c, [s₁ s₂ …])_

Answer a new collection using `atAll` for each row of the sequence of index sequences _s_.

At a square 5×5 matrix,
using secondary indices,
select the second and fourth entries of the first, third and fifth rows:

```
>>> [5 5].iota.atAllPath([1 3 5; 2 4])
[
	 2  4;
	12 14;
	22 24
]
```

Select the last two columns of a 4×4 matrix,
giving indices as `Range` values:

```
>>> [4 4].iota.atAllPath([1:4, 3:4])
[
	 3  4;
	 7  8;
	11 12;
	15 16
]
```

Select the third column of a 5×5 matrix:

```
>>> [5 4].iota.atAllPath([1:5, [3]])
[3; 7; 11; 15; 19]
```

Answer the first and fifth column entries of the second and fourth rows of the first and third pages of a 3×4×5 array:

```
>>> [3 4 5].iota.atAllPath([1 3; 2 4; 1 5])
[
	 6 10;
	16 20
	:;
	46 50;
	56 60
]
```

Answer the second column of the third and fourth pages of a 5×4×3 array:

```
>>> [5 4 3].iota.atAllPath([3:4, 1:4, 2:2])
[
	26;
	29;
	32;
	35
	:;
	38;
	41;
	44;
	47
]
```

* * *

See also: at, atAll, atPath

Guides: Indexing Functions

Categories: Accessing
