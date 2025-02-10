# zeros

- _zeros(shape)_

Create array of all zeros with specified _shape_.

Create a 4×4 matrix of zeros:

```
>>> [4 4].zeros
[
	0 0 0 0;
	0 0 0 0;
	0 0 0 0;
	0 0 0 0
]
```

Create a 2×3×4 matrix of zeros:

```
>>> [2 3 4].zeros
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

Create an array of zeros that is the same size as an existing array:

```
>>> let a = [1 4; 2 5; 3 6];
>>> a.shape.zeros
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

See also: ones, reshape, zero

Rererences:
_Mathworks_
[1](https://mathworks.com/help/matlab/ref/zeros.html)
