# zeroes

- _zeroes(shape)_

Create array of all zeroes with specified _shape_.

A nine-vector of zeroes:

```
>>> [9].zeroes
[0 0 0 0 0 0 0 0 0]

>>> [1].linearRecurrence([0], 9)
[0 0 0 0 0 0 0 0 0]
```

Create a 4×4 matrix of zeroes:

```
>>> [4 4].zeroes
[
	0 0 0 0;
	0 0 0 0;
	0 0 0 0;
	0 0 0 0
]
```

Create a 2×3×4 matrix of zeroes:

```
>>> [2 3 4].zeroes
[
	0 0 0 0;
	0 0 0 0;
	0 0 0 0
	:;
	0 0 0 0;
	0 0 0 0;
	0 0 0 0
]
```

Create an array of zeroes that is the same size as an existing array:

```
>>> let a = [1 4; 2 5; 3 6];
>>> a.shape.zeroes
[
	0 0;
	0 0;
	0 0
]
```

Use `zero` to copy element type of existing array:

```
>>> [1J2 3J4; 5J6 7J8].zero
[
	0J0 0J0;
	0J0 0J0
]
```

* * *

See also: ones, reshape, zero, zeroMatrix

Guides: Matrix Functions

Rererences:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/zeros.html),
_Python_
[1](https://numpy.org/doc/stable/reference/generated/numpy.zeros.html)
