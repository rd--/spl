# ones

- _ones(shape)_

Create array of all ones with specified _shape_.

A nine-vector of ones:

```
>>> [9].ones
[1 1 1 1 1 1 1 1 1]

>>> [1].linearRecurrence([1], 9)
[1 1 1 1 1 1 1 1 1]
```

Create a 4×4 matrix of ones:

```
>>> [4 4].ones
[
	1 1 1 1;
	1 1 1 1;
	1 1 1 1;
	1 1 1 1
]

>>> [4 4].ones
[1].reshape([4 4])
```

Use `one` to copy element type of existing array:

```
>>> [1J2 3J4; 5J6 7J8].one
[
	1J0 1J0;
	1J0 1J0
]
```

* * *

See also: one, reshape, zero, zeroes, zeroMatrix

Guides: Matrix Functions

References:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/ones.html)
