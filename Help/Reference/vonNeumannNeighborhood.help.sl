# vonNeumannNeighborhood

- _vonNeumannNeighborhood(d, r)_

Answer the coordinates,
or indices,
of the _d_-dimensional von Neumann neighborhood of range,
or extent,
_r_.

The number of cells in a von Neumann neighborhood,
including the center cell,
is given by `delannoyNumber`.

In one dimension:

```
>>> vonNeumannNeighborhood(1, 1)
[-1; 1]

>>> delannoyNumber(1, 1)
3

>>> vonNeumannNeighborhood(1, 2)
[-2; -1; 1; 2]

>>> delannoyNumber(1, 2)
5
```

In two dimensions:

```
>>> vonNeumannNeighborhood(2, 1)
[
	        0 -1;
	-1  0;         1  0;
	        0  1
]

>>> delannoyNumber(2, 1)
5

>>> vonNeumannNeighborhood(2, 2)
[
	               0 -2;
	       -1 -1;  0 -1;  1 -1;
	-2  0; -1  0;         1  0;  2  0;
	       -1  1;  0  1;  1  1;
	               0  2
]

>>> delannoyNumber(2, 2)
13
```

In three dimensions:

```
>>> vonNeumannNeighborhood(3, 1)
[
	0  0 -1; 0 -1 0; -1 0 0;
	1  0  0; 0  1 0;  0 0 1
]

>>> delannoyNumber(3, 1)
7

>>> vonNeumannNeighborhood(3, 2)
[
	0  0 -2; 0 -1 -1; -1  0 -1;  0  0 -1;
	1  0 -1; 0  1 -1;  0 -2  0; -1 -1  0;
	0 -1  0; 1 -1  0; -2  0  0; -1  0  0;
	1  0  0; 2  0  0; -1  1  0;  0  1  0;
	1  1  0; 0  2  0;  0 -1  1; -1  0  1;
	0  0  1; 1  0  1;  0  1  1;  0  0  2
]

>>> delannoyNumber(3, 2)
25
```

* * *

See also: mooreNeighborhood

References:
_Mathematica_
[1](https://mathworld.wolfram.com/vonNeumannNeighborhood.html)
_W_
[1](https://en.wikipedia.org/wiki/Von_Neumann_neighborhood)
